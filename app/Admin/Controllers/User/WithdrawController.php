<?php

namespace App\Admin\Controllers\User;

use App\Models\User\Withdraw;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class WithdrawController extends Controller
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
        $grid = new Grid(new Withdraw);

        $grid->id('ID');
        $grid->user_id('user_id');
        $grid->wallet_id('wallet_id');
        $grid->type('type');
        $grid->name('name');
        $grid->tel('tel');
        $grid->bank_card('bank_card');
        $grid->bank_address('bank_address');
        $grid->status('status');
        $grid->remark('remark');
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
        $show = new Show(Withdraw::findOrFail($id));

        $show->id('ID');
        $show->user_id('user_id');
        $show->wallet_id('wallet_id');
        $show->type('type');
        $show->name('name');
        $show->tel('tel');
        $show->bank_card('bank_card');
        $show->bank_address('bank_address');
        $show->status('status');
        $show->remark('remark');
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
        $form = new Form(new Withdraw);

        $form->display('ID');
        $form->text('user_id', 'user_id');
        $form->text('wallet_id', 'wallet_id');
        $form->text('type', 'type');
        $form->text('name', 'name');
        $form->text('tel', 'tel');
        $form->text('bank_card', 'bank_card');
        $form->text('bank_address', 'bank_address');
        $form->text('status', 'status');
        $form->text('remark', 'remark');
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }
}
