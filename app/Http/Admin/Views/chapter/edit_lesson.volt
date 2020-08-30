{% extends 'templates/main.volt' %}

{% block content %}

    {%- macro content_title(model) %}
        {% if model == '1' %}
            点播信息
        {% elseif model == '2' %}
            直播信息
        {% elseif model == '3' %}
            图文信息
        {% endif %}
    {%- endmacro %}

    <fieldset class="layui-elem-field layui-field-title">
        <legend>编辑课时</legend>
    </fieldset>

    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title kg-tab-title">
            <li class="layui-this">基本信息</li>
            <li>{{ content_title(course.model) }}</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                {{ partial('chapter/edit_lesson_basic') }}
            </div>
            <div class="layui-tab-item">
                {% if course.model == '1' %}
                    {{ partial('chapter/edit_lesson_vod') }}
                {% elseif course.model == '2' %}
                    {{ partial('chapter/edit_lesson_live') }}
                {% elseif course.model == '3' %}
                    {{ partial('chapter/edit_lesson_read') }}
                {% endif %}
            </div>
        </div>
    </div>

{% endblock %}

{% block link_css %}

    {% if chapter.model == '3' %}
        {{ css_link('https://cdn.jsdelivr.net/npm/vditor/dist/index.css', false) }}
    {% endif %}

{% endblock %}

{% block include_js %}

    {% if chapter.model == '3' %}

        {{ js_include('https://cdn.jsdelivr.net/npm/vditor/dist/index.min.js', false) }}
        {{ js_include('admin/js/vditor.js') }}

    {% elseif chapter.model == '1' %}

        {{ js_include('lib/vod-js-sdk-v6.min.js') }}
        {{ js_include('lib/clipboard.min.js') }}
        {{ js_include('admin/js/media.upload.js') }}
        {{ js_include('admin/js/media.preview.js') }}
        {{ js_include('admin/js/copy.js') }}

    {% endif %}

{% endblock %}

{% block inline_js %}

    <script>

        layui.use(['jquery', 'layer', 'laydate'], function () {

            var $ = layui.jquery;
            var layer = layui.layer;
            var laydate = layui.laydate;

            laydate.render({
                elem: 'input[name=start_time]',
                type: 'datetime'
            });

            laydate.render({
                elem: 'input[name=end_time]',
                type: 'datetime'
            });

            $('#show-push-test').on('click', function () {
                var streamName = $('input[name=stream_name]').val();
                var url = '/admin/test/live/push?stream=' + streamName;
                layer.open({
                    type: 2,
                    title: '推流测试',
                    area: ['720px', '500px'],
                    content: [url, 'no']
                });
            });

        });

    </script>

{% endblock %}