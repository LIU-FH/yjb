<?php

namespace App\Admin\Controllers\Goods;

use App\Models\Goods\GoodsSearch;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class GoodsSearchController extends Controller
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
        $grid = new Grid(new GoodsSearch);

        $grid->id('ID');
        $grid->user_id(__('goods_search.user_id'))->expand(function ($model) {
            return new Table(['Key', 'Value'], $model->user->toArray());
        });
        $grid->type(__('goods_search.type'));
        $grid->name(__('goods_search.name'));
        $grid->price(__('goods_search.price'));
        $grid->num(__('goods_search.num'));
        $grid->more(__('goods_search.more'));
        $grid->imgs(__('goods_search.imgs'))->gallery(['zooming' => true, 'width' => 100, 'height' => 100]);
        $grid->status(__('goods_search.status'))->using(GoodsSearch::$EnumStatus)->label([0 => 'default', 1 => 'info'])->sortable();
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
        $show = new Show(GoodsSearch::findOrFail($id));

        $show->id('ID');
        $show->user_id(__('goods_search.user_id'));
        $show->type(__('goods_search.type'));
        $show->name(__('goods_search.name'));
        $show->price(__('goods_search.price'));
        $show->num(__('goods_search.num'));
        $show->more(__('goods_search.more'));
        $show->imgs(__('goods_search.imgs'))->image();
        $show->status(__('goods_search.status'))->using(GoodsSearch::$EnumStatus);
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
        $form = new Form(new GoodsSearch);

        $form->display('ID');
        $form->text('user_id', __('goods_search.user_id'));
        $form->text('type', __('goods_search.type'));
        $form->text('name', __('goods_search.name'));
        $form->text('price', __('goods_search.price'));
        $form->text('num', __('goods_search.num'));
        $form->text('more', __('goods_search.more'));
        $form->multipleImage('imgs', __('goods_search.imgs'));
        $form->switch('status', "是否已处理")->default(0);
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }
}
