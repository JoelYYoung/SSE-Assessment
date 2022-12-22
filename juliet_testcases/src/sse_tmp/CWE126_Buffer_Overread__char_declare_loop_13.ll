; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !35
  %cmp = icmp eq i32 %0, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay3, i8** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !53
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx5, align 1, !dbg !55
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !57
  store i64 %call, i64* %destLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !62
  %2 = load i64, i64* %destLen, align 8, !dbg !64
  %cmp7 = icmp ult i64 %1, %2, !dbg !65
  br i1 %cmp7, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !67
  %4 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx8 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !67
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !67
  %6 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !71
  store i8 %5, i8* %arrayidx9, align 1, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %7, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx10, align 1, !dbg !80
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  call void @printLine(i8* %arraydecay11), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_13_good() #0 !dbg !84 {
entry:
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__char_declare_loop_13_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__char_declare_loop_13_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !114
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !117
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx2, align 1, !dbg !119
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !120
  %cmp = icmp ne i32 %0, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.else, !dbg !123

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !124
  br label %if.end, !dbg !126

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  store i8* %arraydecay3, i8** %data, align 8, !dbg !129
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !137
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !138
  store i8 0, i8* %arrayidx5, align 1, !dbg !139
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !141
  store i64 %call, i64* %destLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !146
  %2 = load i64, i64* %destLen, align 8, !dbg !148
  %cmp7 = icmp ult i64 %1, %2, !dbg !149
  br i1 %cmp7, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !151
  %4 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx8 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !151
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !151
  %6 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !155
  store i8 %5, i8* %arrayidx9, align 1, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %7, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !162
  store i8 0, i8* %arrayidx10, align 1, !dbg !163
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !164
  call void @printLine(i8* %arraydecay11), !dbg !165
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !167 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !172, metadata !DIExpression()), !dbg !173
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !174
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !175
  store i8 0, i8* %arrayidx, align 1, !dbg !176
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !177
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !178
  store i8 0, i8* %arrayidx2, align 1, !dbg !179
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !180
  %cmp = icmp eq i32 %0, 5, !dbg !182
  br i1 %cmp, label %if.then, label %if.end, !dbg !183

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !184
  store i8* %arraydecay3, i8** %data, align 8, !dbg !186
  br label %if.end, !dbg !187

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !188, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !191, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !193, metadata !DIExpression()), !dbg !194
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !195
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !195
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !196
  store i8 0, i8* %arrayidx5, align 1, !dbg !197
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !198
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !199
  store i64 %call, i64* %destLen, align 8, !dbg !200
  store i64 0, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !204
  %2 = load i64, i64* %destLen, align 8, !dbg !206
  %cmp7 = icmp ult i64 %1, %2, !dbg !207
  br i1 %cmp7, label %for.body, label %for.end, !dbg !208

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !209
  %4 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx8 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !209
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !209
  %6 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !213
  store i8 %5, i8* %arrayidx9, align 1, !dbg !214
  br label %for.inc, !dbg !215

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !216
  %inc = add i64 %7, 1, !dbg !216
  store i64 %inc, i64* %i, align 8, !dbg !216
  br label %for.cond, !dbg !217, !llvm.loop !218

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !220
  store i8 0, i8* %arrayidx10, align 1, !dbg !221
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !222
  call void @printLine(i8* %arraydecay11), !dbg !223
  ret void, !dbg !224
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_13.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 32, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!37 = !DILocation(line: 32, column: 25, scope: !36)
!38 = !DILocation(line: 32, column: 8, scope: !11)
!39 = !DILocation(line: 35, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 33, column: 5)
!41 = !DILocation(line: 35, column: 14, scope: !40)
!42 = !DILocation(line: 36, column: 5, scope: !40)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 38, type: !45)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 38, column: 16, scope: !44)
!49 = !DILocalVariable(name: "destLen", scope: !44, file: !12, line: 38, type: !45)
!50 = !DILocation(line: 38, column: 19, scope: !44)
!51 = !DILocalVariable(name: "dest", scope: !44, file: !12, line: 39, type: !25)
!52 = !DILocation(line: 39, column: 14, scope: !44)
!53 = !DILocation(line: 40, column: 9, scope: !44)
!54 = !DILocation(line: 41, column: 9, scope: !44)
!55 = !DILocation(line: 41, column: 21, scope: !44)
!56 = !DILocation(line: 42, column: 26, scope: !44)
!57 = !DILocation(line: 42, column: 19, scope: !44)
!58 = !DILocation(line: 42, column: 17, scope: !44)
!59 = !DILocation(line: 45, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !44, file: !12, line: 45, column: 9)
!61 = !DILocation(line: 45, column: 14, scope: !60)
!62 = !DILocation(line: 45, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !12, line: 45, column: 9)
!64 = !DILocation(line: 45, column: 25, scope: !63)
!65 = !DILocation(line: 45, column: 23, scope: !63)
!66 = !DILocation(line: 45, column: 9, scope: !60)
!67 = !DILocation(line: 47, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !12, line: 46, column: 9)
!69 = !DILocation(line: 47, column: 28, scope: !68)
!70 = !DILocation(line: 47, column: 18, scope: !68)
!71 = !DILocation(line: 47, column: 13, scope: !68)
!72 = !DILocation(line: 47, column: 21, scope: !68)
!73 = !DILocation(line: 48, column: 9, scope: !68)
!74 = !DILocation(line: 45, column: 35, scope: !63)
!75 = !DILocation(line: 45, column: 9, scope: !63)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 48, column: 9, scope: !60)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 49, column: 9, scope: !44)
!80 = !DILocation(line: 49, column: 21, scope: !44)
!81 = !DILocation(line: 50, column: 19, scope: !44)
!82 = !DILocation(line: 50, column: 9, scope: !44)
!83 = !DILocation(line: 52, column: 1, scope: !11)
!84 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_13_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 129, column: 5, scope: !84)
!86 = !DILocation(line: 130, column: 5, scope: !84)
!87 = !DILocation(line: 131, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !89, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !12, line: 143, type: !91)
!94 = !DILocation(line: 143, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !12, line: 143, type: !92)
!96 = !DILocation(line: 143, column: 27, scope: !88)
!97 = !DILocation(line: 146, column: 22, scope: !88)
!98 = !DILocation(line: 146, column: 12, scope: !88)
!99 = !DILocation(line: 146, column: 5, scope: !88)
!100 = !DILocation(line: 148, column: 5, scope: !88)
!101 = !DILocation(line: 149, column: 5, scope: !88)
!102 = !DILocation(line: 150, column: 5, scope: !88)
!103 = !DILocation(line: 153, column: 5, scope: !88)
!104 = !DILocation(line: 154, column: 5, scope: !88)
!105 = !DILocation(line: 155, column: 5, scope: !88)
!106 = !DILocation(line: 157, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 61, type: !16)
!109 = !DILocation(line: 61, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !12, line: 62, type: !20)
!111 = !DILocation(line: 62, column: 10, scope: !107)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !12, line: 63, type: !25)
!113 = !DILocation(line: 63, column: 10, scope: !107)
!114 = !DILocation(line: 64, column: 5, scope: !107)
!115 = !DILocation(line: 65, column: 5, scope: !107)
!116 = !DILocation(line: 65, column: 25, scope: !107)
!117 = !DILocation(line: 66, column: 5, scope: !107)
!118 = !DILocation(line: 67, column: 5, scope: !107)
!119 = !DILocation(line: 67, column: 27, scope: !107)
!120 = !DILocation(line: 68, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !107, file: !12, line: 68, column: 8)
!122 = !DILocation(line: 68, column: 25, scope: !121)
!123 = !DILocation(line: 68, column: 8, scope: !107)
!124 = !DILocation(line: 71, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 69, column: 5)
!126 = !DILocation(line: 72, column: 5, scope: !125)
!127 = !DILocation(line: 76, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !12, line: 74, column: 5)
!129 = !DILocation(line: 76, column: 14, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !131, file: !12, line: 79, type: !45)
!131 = distinct !DILexicalBlock(scope: !107, file: !12, line: 78, column: 5)
!132 = !DILocation(line: 79, column: 16, scope: !131)
!133 = !DILocalVariable(name: "destLen", scope: !131, file: !12, line: 79, type: !45)
!134 = !DILocation(line: 79, column: 19, scope: !131)
!135 = !DILocalVariable(name: "dest", scope: !131, file: !12, line: 80, type: !25)
!136 = !DILocation(line: 80, column: 14, scope: !131)
!137 = !DILocation(line: 81, column: 9, scope: !131)
!138 = !DILocation(line: 82, column: 9, scope: !131)
!139 = !DILocation(line: 82, column: 21, scope: !131)
!140 = !DILocation(line: 83, column: 26, scope: !131)
!141 = !DILocation(line: 83, column: 19, scope: !131)
!142 = !DILocation(line: 83, column: 17, scope: !131)
!143 = !DILocation(line: 86, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !131, file: !12, line: 86, column: 9)
!145 = !DILocation(line: 86, column: 14, scope: !144)
!146 = !DILocation(line: 86, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 86, column: 9)
!148 = !DILocation(line: 86, column: 25, scope: !147)
!149 = !DILocation(line: 86, column: 23, scope: !147)
!150 = !DILocation(line: 86, column: 9, scope: !144)
!151 = !DILocation(line: 88, column: 23, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !12, line: 87, column: 9)
!153 = !DILocation(line: 88, column: 28, scope: !152)
!154 = !DILocation(line: 88, column: 18, scope: !152)
!155 = !DILocation(line: 88, column: 13, scope: !152)
!156 = !DILocation(line: 88, column: 21, scope: !152)
!157 = !DILocation(line: 89, column: 9, scope: !152)
!158 = !DILocation(line: 86, column: 35, scope: !147)
!159 = !DILocation(line: 86, column: 9, scope: !147)
!160 = distinct !{!160, !150, !161, !78}
!161 = !DILocation(line: 89, column: 9, scope: !144)
!162 = !DILocation(line: 90, column: 9, scope: !131)
!163 = !DILocation(line: 90, column: 21, scope: !131)
!164 = !DILocation(line: 91, column: 19, scope: !131)
!165 = !DILocation(line: 91, column: 9, scope: !131)
!166 = !DILocation(line: 93, column: 1, scope: !107)
!167 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 96, type: !13, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!168 = !DILocalVariable(name: "data", scope: !167, file: !12, line: 98, type: !16)
!169 = !DILocation(line: 98, column: 12, scope: !167)
!170 = !DILocalVariable(name: "dataBadBuffer", scope: !167, file: !12, line: 99, type: !20)
!171 = !DILocation(line: 99, column: 10, scope: !167)
!172 = !DILocalVariable(name: "dataGoodBuffer", scope: !167, file: !12, line: 100, type: !25)
!173 = !DILocation(line: 100, column: 10, scope: !167)
!174 = !DILocation(line: 101, column: 5, scope: !167)
!175 = !DILocation(line: 102, column: 5, scope: !167)
!176 = !DILocation(line: 102, column: 25, scope: !167)
!177 = !DILocation(line: 103, column: 5, scope: !167)
!178 = !DILocation(line: 104, column: 5, scope: !167)
!179 = !DILocation(line: 104, column: 27, scope: !167)
!180 = !DILocation(line: 105, column: 8, scope: !181)
!181 = distinct !DILexicalBlock(scope: !167, file: !12, line: 105, column: 8)
!182 = !DILocation(line: 105, column: 25, scope: !181)
!183 = !DILocation(line: 105, column: 8, scope: !167)
!184 = !DILocation(line: 108, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !12, line: 106, column: 5)
!186 = !DILocation(line: 108, column: 14, scope: !185)
!187 = !DILocation(line: 109, column: 5, scope: !185)
!188 = !DILocalVariable(name: "i", scope: !189, file: !12, line: 111, type: !45)
!189 = distinct !DILexicalBlock(scope: !167, file: !12, line: 110, column: 5)
!190 = !DILocation(line: 111, column: 16, scope: !189)
!191 = !DILocalVariable(name: "destLen", scope: !189, file: !12, line: 111, type: !45)
!192 = !DILocation(line: 111, column: 19, scope: !189)
!193 = !DILocalVariable(name: "dest", scope: !189, file: !12, line: 112, type: !25)
!194 = !DILocation(line: 112, column: 14, scope: !189)
!195 = !DILocation(line: 113, column: 9, scope: !189)
!196 = !DILocation(line: 114, column: 9, scope: !189)
!197 = !DILocation(line: 114, column: 21, scope: !189)
!198 = !DILocation(line: 115, column: 26, scope: !189)
!199 = !DILocation(line: 115, column: 19, scope: !189)
!200 = !DILocation(line: 115, column: 17, scope: !189)
!201 = !DILocation(line: 118, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !189, file: !12, line: 118, column: 9)
!203 = !DILocation(line: 118, column: 14, scope: !202)
!204 = !DILocation(line: 118, column: 21, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !12, line: 118, column: 9)
!206 = !DILocation(line: 118, column: 25, scope: !205)
!207 = !DILocation(line: 118, column: 23, scope: !205)
!208 = !DILocation(line: 118, column: 9, scope: !202)
!209 = !DILocation(line: 120, column: 23, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !12, line: 119, column: 9)
!211 = !DILocation(line: 120, column: 28, scope: !210)
!212 = !DILocation(line: 120, column: 18, scope: !210)
!213 = !DILocation(line: 120, column: 13, scope: !210)
!214 = !DILocation(line: 120, column: 21, scope: !210)
!215 = !DILocation(line: 121, column: 9, scope: !210)
!216 = !DILocation(line: 118, column: 35, scope: !205)
!217 = !DILocation(line: 118, column: 9, scope: !205)
!218 = distinct !{!218, !208, !219, !78}
!219 = !DILocation(line: 121, column: 9, scope: !202)
!220 = !DILocation(line: 122, column: 9, scope: !189)
!221 = !DILocation(line: 122, column: 21, scope: !189)
!222 = !DILocation(line: 123, column: 19, scope: !189)
!223 = !DILocation(line: 123, column: 9, scope: !189)
!224 = !DILocation(line: 125, column: 1, scope: !167)
