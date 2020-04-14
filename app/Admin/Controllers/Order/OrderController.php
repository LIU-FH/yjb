<?php

namespace App\Admin\Controllers\Order;

use App\Models\Order\Order;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class OrderController extends Controller
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
        $grid = new Grid(new Order);

        $grid->id('ID');
        $grid->order_no('order_no');
        $grid->user_id('user_id');
        $grid->count('count');
        $grid->amount_total('amount_total');
        $grid->amount('amount');
        $grid->balance('balance');
        $grid->wx_balance('wx_balance');
        $grid->discount('discount');
        $grid->address_name('address_name');
        $grid->address_tel('address_tel');
        $grid->address_details('address_details');
        $grid->status('status');
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
        $show = new Show(Order::findOrFail($id));

        $show->id('ID');
        $show->order_no('order_no');
        $show->user_id('user_id');
        $show->count('count');
        $show->amount_total('amount_total');
        $show->amount('amount');
        $show->balance('balance');
        $show->wx_balance('wx_balance');
        $show->discount('discount');
        $show->address_name('address_name');
        $show->address_tel('address_tel');
        $show->address_details('address_details');
        $show->status('status');
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
        $form = new Form(new Order);

        $form->display('ID');
        $form->text('order_no', 'order_no');
        $form->text('user_id', 'user_id');
        $form->text('count', 'count');
        $form->text('amount_total', 'amount_total');
        $form->text('amount', 'amount');
        $form->text('balance', 'balance');
        $form->text('wx_balance', 'wx_balance');
        $form->text('discount', 'discount');
        $form->text('address_name', 'address_name');
        $form->text('address_tel', 'address_tel');
        $form->text('address_details', 'address_details');
        $form->text('status', 'status');
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }
}
