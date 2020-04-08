<form class="layui-form kg-form" method="POST" action="{{ url({'for':'admin.topic.update','id':topic.id}) }}">

    <fieldset class="layui-elem-field layui-field-title">
        <legend>编辑话题</legend>
    </fieldset>

    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input class="layui-input" type="text" name="title" value="{{ topic.title }}" lay-verify="required">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">简介</label>
        <div class="layui-input-block">
            <input class="layui-input" type="text" name="summary" value="{{ topic.summary }}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">相关课程</label>
        <div class="layui-input-block">
            <div id="xm-course-ids"></div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <button class="kg-submit layui-btn" lay-submit="true" lay-filter="go">提交</button>
            <button type="button" class="kg-back layui-btn layui-btn-primary">返回</button>
        </div>
    </div>

</form>

{{ js_include('lib/xm-select.js') }}
{{ js_include('admin/js/xm-course.js') }}

<script>

    xmCourse({{ xm_courses|json_encode }}, '/admin/xm/course/all');

</script>