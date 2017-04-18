{extends 'layout'}

{block content}
    <div class="container clearfix">
        <div class="people-list col-md-4">

            {*<div class="search">*}
                {*<input type="text" placeholder="Search"/>*}
                {*<i class="fa fa-search"></i>*}
            {*</div>*}

            <div class="search input-group">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-addon">
                    <i class="fa fa-search"> </i>
                </span>
            </div>

            <ul class="list scrollbar" id="users-list">

                {*<li class="clearfix">*}
                    {*<img src="https://avatars3.githubusercontent.com/u/25158980?v=3&s=40" alt="avatar"/>*}
                    {*<div class="about">*}
                        {*<div class="name">*}
                            {*Deimos Project*}
                        {*</div>*}
                        {*<div class="status">*}
                            {*<i class="fa fa-circle online"></i> online*}
                        {*</div>*}
                    {*</div>*}
                {*</li>*}

            </ul>
        </div>

        <div class="chat col-md-8">

            <div class="modal-view">
                <h1>Profile</h1>
                <hr/>
            </div>

            <div class="chat-header clearfix">
                <img src="https://avatars3.githubusercontent.com/u/25158980?v=3&s=40" alt="avatar"/>

                <div class="chat-about">
                    <div class="chat-with">Chat Deimos Project</div>
                    <div class="chat-num-messages">already <span id="already"></span> messages</div>
                </div>
                <i class="fa fa-star"></i>

                <div class="sign-out pull-right">
                    <i class="fa fa-user"></i>
                    <a href="#" id="profile" title="{$user->login}">
                        Profile
                    </a>
                </div>
            </div>

            <div class="chat-history scrollbar" id="messages">

                {*<ul>*}

                    {*<li class="clearfix">*}
                        {*<div class="message-data align-right">*}
                            {*<span class="message-data-time">16:11, Today</span> &nbsp; &nbsp;*}
                            {*<span class="message-data-name">Max</span> <i class="fa fa-circle me"></i>*}

                        {*</div>*}
                        {*<div class="message other-message float-right">*}
                            {*Hello! How are you?*}
                        {*</div>*}
                    {*</li>*}

                    {*<li>*}
                        {*<div class="message-data">*}
                            {*<span class="message-data-name"><i class="fa fa-circle online"></i> Sergey</span>*}
                            {*<span class="message-data-time">16:12, Today</span>*}
                        {*</div>*}
                        {*<div class="message my-message">*}
                            {*Hi! I'm fine!*}
                        {*</div>*}
                    {*</li>*}

                {*</ul>*}

            </div>

            <div class="chat-message clearfix">
                <form id="message-to">
                    <textarea name="message-to-send" id="message-to-send" placeholder="Type your message"
                              rows="3"></textarea>

                    <!-- #message-to-send.keydown(() => (e.ctrlKey || e.metaKey) && (e.keyCode == 13 || e.keyCode == 10)) -->

                    <button type="submit">send</button>
                    <button type="reset">reset</button>
                </form>
            </div>

        </div>

    </div>
{/block}

{block css}
    <link href="{'/css/view.css'|asset}" rel="stylesheet"/>
{/block}