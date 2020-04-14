<?php

namespace App\Admin\Controllers\Goods;

use App\Models\Goods\Goods;
use App\Models\Goods\GoodsGroup;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class GoodsGroupController extends Controller
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
        $grid = new Grid(new GoodsGroup);
        $oGroupGoods = Goods::where('category_id', 1)->select(['id', 'title'])->get();
        $aGroupGoods = [];
        foreach ($oGroupGoods as $item) {
            $aGroupGoods[$item->id] = $item->title;
        }
        $grid->id('ID');
        $grid->goods_id('goods_id')->display(function ($value) use ($aGroupGoods) {
            return $aGroupGoods[$value];
        });
        $grid->start_date('start_date');
        $grid->end_date('end_date');
        $grid->start_time('start_time');
        $grid->end_time('end_time');
        $grid->status(__('goods.status'))->using(Goods::$EnumStatus)->label([0 => 'default', 1 => 'info'])->sortable();
        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

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
        $show = new Show(GoodsGroup::findOrFail($id));

        $show->id('ID');
        $show->goods_id('goods_id');
        $show->start_date('start_date');
        $show->end_date('end_date');
        $show->start_time('start_time');
        $show->end_time('end_time');
        $show->status(__('goods.status'))->using(Goods::$EnumStatus)->label([0 => 'default', 1 => 'info']);
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
        $form = new Form(new GoodsGroup);

        $form->display('ID');
        $oGroupGoods = Goods::where('category_id', 1)->select(['id', 'title'])->get();
        $aGroupGoods = [];
        foreach ($oGroupGoods as $item) {
            $aGroupGoods[$item->id] = $item->title;
        }
        $form->select('goods_id', 'goods_id')->options($aGroupGoods);
        $form->date('start_date', 'start_date')->format('YYYY-MM-DD');
        $form->date('end_date', 'end_date')->format('YYYY-MM-DD');
        $form->time('start_time', 'start_time')->format('HH:mm:ss');
        $form->time('end_time', 'end_time')->format('HH:mm:ss');
        $form->switch('status', "是否上架")->default(0);
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }
}
