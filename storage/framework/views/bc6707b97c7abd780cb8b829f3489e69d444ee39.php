<?php $__env->startSection('custom_css'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="block-header">
        <h2>DASHBOARD</h2>
    </div>

    <!-- Widgets -->
    <div class="row clearfix">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-pink hover-expand-effect">
                <div class="icon">
                    <i class="material-icons">playlist_add_check</i>
                </div>
                <div class="content">
                    <div class="text">DATA KEGIATAN</div>
                    <div class="number count-to">354</div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-cyan hover-expand-effect">
                <div class="icon">
                    <i class="material-icons">group</i>
                </div>
                <div class="content">
                    <div class="text">DATA KELOMPOK</div>
                    <div class="number count-to">17</div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-light-green hover-expand-effect">
                <div class="icon">
                    <i class="material-icons">content_paste</i>
                </div>
                <div class="content">
                    <div class="text">DATA LAPORAN</div>
                    <div class="number count-to">12</div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-orange hover-expand-effect">
                <div class="icon">
                    <i class="material-icons">person</i>
                </div>
                <div class="content">
                    <div class="text">DATA USER</div>
                    <div class="number count-to">3</div>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Widgets -->
<?php $__env->stopSection(); ?>

<?php $__env->startSection('custom_js'); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layout.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>