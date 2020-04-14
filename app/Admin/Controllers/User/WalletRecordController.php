<?php

namespace App\Admin\Controllers\User;

use App\Models\User\WalletRecord;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class WalletRecordController extends Controller
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
        $grid = new Grid(new WalletRecord);

        $grid->id('ID');
        $grid->user_id('user_id');
        $grid->wallet_id('wallet_id');
        $grid->amount('amount');
        $grid->type_id('type_id');
        $grid->change('change');
        $grid->desc('desc');
        $grid->remark('remark');
        $grid->expand_data('expand_data');
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
        $show = new Show(WalletRecord::findOrFail($id));

        $show->id('ID');
        $show->user_id('user_id');
        $show->wallet_id('wallet_id');
        $show->amount('amount');
        $show->type_id('type_id');
        $show->change('change');
        $show->desc('desc');
        $show->remark('remark');
        $show->expand_data('expand_data');
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
        $form = new Form(new WalletRecord);

        $form->display('ID');
        $form->text('user_id', 'user_id');
        $form->text('wallet_id', 'wallet_id');
        $form->text('amount', 'amount');
        $form->text('type_id', 'type_id');
        $form->text('change', 'change');
        $form->text('desc', 'desc');
        $form->text('remark', 'remark');
        $form->text('expand_data', 'expand_data');
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }
}
