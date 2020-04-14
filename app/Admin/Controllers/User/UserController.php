<?php

namespace App\Admin\Controllers\User;

use App\Models\User\User;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class UserController extends Controller
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
        $grid = new Grid(new User);

        $grid->id('ID');
        $grid->openid('openid');
        $grid->unionid('unionid');
        $grid->parent_id('parent_id');
        $grid->nickname('nickname');
        $grid->avatarurl('avatarurl')->gravatar(45);
        $grid->gender('gender')->using(User::$EnumGender);
        $grid->phone('phone');
        $grid->last_login_time('last_login_time');
        $grid->status(__('goods.status'))->using(User::$EnumStatus)->label([0 => 'info', 1 => 'default'])->sortable();
        $grid->qr_code('qr_code')->image();
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
        $show = new Show(User::findOrFail($id));

        $show->id('ID');
        $show->openid('openid');
        $show->unionid('unionid');
        $show->parent_id('parent_id');
        $show->nickname('nickname');
        $show->avatarurl('avatarurl');
        $show->gender('gender');
        $show->phone('phone');
        $show->last_login_time('last_login_time');
        $show->status('status');
        $show->qr_code('qr_code');
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
        $form = new Form(new User);

        $form->display('ID');
        $form->text('openid', 'openid');
        $form->text('unionid', 'unionid');
        $form->text('parent_id', 'parent_id');
        $form->text('nickname', 'nickname');
        $form->text('avatarurl', 'avatarurl');
        $form->text('gender', 'gender');
        $form->text('phone', 'phone');
        $form->text('last_login_time', 'last_login_time');
        $form->text('status', 'status');
        $form->text('qr_code', 'qr_code');
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }
}
