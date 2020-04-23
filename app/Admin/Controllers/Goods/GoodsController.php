<?php

namespace App\Admin\Controllers\Goods;

use App\Models\Goods\Goods;
use App\Http\Controllers\Controller;
use App\Models\Goods\GoodsDetails;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\Table;

class GoodsController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('admin.index'))
            ->description(trans('admin.description'))
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header(trans('admin.detail'))
            ->description(trans('admin.description'))
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(trans('admin.edit'))
            ->description(trans('admin.description'))
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(trans('admin.create'))
            ->description(trans('admin.description'))
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Goods);
        $grid->id('ID')->sortable();
        $grid->img(__('goods.img'))->lightbox(['zooming' => true, 'width' => 100, 'height' => 100]);
        $grid->title(__('goods.title'));
        $grid->price(__('goods.price'));
        $grid->discount(__('goods.discount'));
        $grid->tags(__('goods.tags'))->label();
        $grid->stock(__('goods.stock'))->sortable();
        $grid->category_id(__('goods.category_id'))->using(Goods::$EnumCategory);
        $grid->column('details_empty', __('goods.details'))->modal('详情', function ($value) {
            return $value->details;
        });
        $grid->click_count(__('goods.click_count'))->sortable();
        $grid->buy_count(__('goods.buy_count'))->sortable();
        $grid->status(__('goods.status'))->using(Goods::$EnumStatus)->label([0 => 'default', 1 => 'info'])->sortable();
        $grid->start_time(__('goods.start_time'))->sortable();
        $grid->end_time(__('goods.end_time'))->sortable();
        $grid->send_time(__('goods.send_time'))->sortable();

        $grid->filter(function ($filter) {
            $filter->like('title', __('goods.title'));
            $filter->like('tags', __('goods.tags'));
            $filter->equal('category_id', __('goods.category_id'))->select(Goods::$EnumCategory);
            $filter->equal('status', __('goods.status'))->select(Goods::$EnumStatus);
        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Goods::findOrFail($id));

        $show->id('ID');
        $show->title(__('goods.title'));
        $show->img(__('goods.img'))->image();
        $show->price(__('goods.price'));
        $show->discount(__('goods.discount'));
        $show->tags(__('goods.tags'))->label();
        $show->stock(__('goods.stock'));
        $show->details_id(__('goods.details_id'))->image();
        $show->category_id(__('goods.category_id'))->using(Goods::$EnumCategory);
        $show->click_count(__('goods.click_count'));
        $show->buy_count(__('goods.buy_count'));
        $show->start_time(__('goods.start_time'));
        $show->end_time(__('goods.end_time'));
        $show->send_time(__('goods.send_time'));
        $show->status(__('goods.status'));
        $show->status(__('goods.status'))->using(Goods::$EnumStatus);
        $show->created_at(trans('admin.created_at'));
        $show->updated_at(trans('admin.updated_at'));
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Goods);

        $form->display('ID');
        $form->text('title', __('goods.title'))->required();
        $form->image('img', __('goods.img'));
        $form->currency('price', __('goods.price'))->symbol('￥')->required();
        $form->text('discount', __('goods.discount'));
        $form->tags('tags', __('goods.tags'))->required();
        $form->number('stock', __('goods.stock'))->default(0);
        $form->select('category_id', __('goods.category_id'))->options(Goods::$EnumCategory)->default(0);
        $form->number('click_count', __('goods.click_count'))->default(0);
        $form->number('buy_count', __('goods.buy_count'))->default(0);
        $form->datetime('start_time', __('goods.start_time'))->format('YYYY-MM-DD HH:mm:ss');
        $form->datetime('end_time', __('goods.end_time'))->format('YYYY-MM-DD HH:mm:ss');
        $form->datetime('send_time', __('goods.send_time'))->format('YYYY-MM-DD HH:mm:ss');
        $form->switch('status', "是否上架")->default(0);
        $form->UEditor('details', __('goods.details'));
        return $form;
    }
}
