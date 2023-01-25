; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %6, i8** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx2, align 1, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !52
  store i64 %call, i64* %destLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !57
  %8 = load i64, i64* %destLen, align 8, !dbg !59
  %cmp = icmp ult i64 %7, %8, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !62
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !62
  %12 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !66
  store i8 %11, i8* %arrayidx5, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %13, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx6, align 1, !dbg !75
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !76
  call void @printLine(i8* %arraydecay7), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_15_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE126_Buffer_Overread__char_alloca_loop_15_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE126_Buffer_Overread__char_alloca_loop_15_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 50, align 16, !dbg !107
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %1 = alloca i8, i64 100, align 16, !dbg !110
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !109
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !112
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !116
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !117
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !117
  store i8 0, i8* %arrayidx1, align 1, !dbg !118
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !119
  store i8* %6, i8** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !128
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx2, align 1, !dbg !130
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !132
  store i64 %call, i64* %destLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !137
  %8 = load i64, i64* %destLen, align 8, !dbg !139
  %cmp = icmp ult i64 %7, %8, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !142
  %10 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !142
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !142
  %12 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !146
  store i8 %11, i8* %arrayidx5, align 1, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %13, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !153
  store i8 0, i8* %arrayidx6, align 1, !dbg !154
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !155
  call void @printLine(i8* %arraydecay7), !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !158 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %0 = alloca i8, i64 50, align 16, !dbg !163
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  %1 = alloca i8, i64 100, align 16, !dbg !166
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !165
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !168
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !172
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !173
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !173
  store i8 0, i8* %arrayidx1, align 1, !dbg !174
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !175
  store i8* %6, i8** %data, align 8, !dbg !176
  call void @llvm.dbg.declare(metadata i64* %i, metadata !177, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !182, metadata !DIExpression()), !dbg !183
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !184
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !184
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !185
  store i8 0, i8* %arrayidx2, align 1, !dbg !186
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !187
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !188
  store i64 %call, i64* %destLen, align 8, !dbg !189
  store i64 0, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !193
  %8 = load i64, i64* %destLen, align 8, !dbg !195
  %cmp = icmp ult i64 %7, %8, !dbg !196
  br i1 %cmp, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !198
  %10 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !198
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !198
  %12 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !202
  store i8 %11, i8* %arrayidx5, align 1, !dbg !203
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !205
  %inc = add i64 %13, 1, !dbg !205
  store i64 %inc, i64* %i, align 8, !dbg !205
  br label %for.cond, !dbg !206, !llvm.loop !207

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !209
  store i8 0, i8* %arrayidx6, align 1, !dbg !210
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !211
  call void @printLine(i8* %arraydecay7), !dbg !212
  ret void, !dbg !213
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 12, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 27, scope: !13)
!33 = !DILocation(line: 36, column: 16, scope: !13)
!34 = !DILocation(line: 36, column: 14, scope: !13)
!35 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 44, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 44, column: 16, scope: !36)
!41 = !DILocalVariable(name: "destLen", scope: !36, file: !14, line: 44, type: !37)
!42 = !DILocation(line: 44, column: 19, scope: !36)
!43 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 45, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 45, column: 14, scope: !36)
!48 = !DILocation(line: 46, column: 9, scope: !36)
!49 = !DILocation(line: 47, column: 9, scope: !36)
!50 = !DILocation(line: 47, column: 21, scope: !36)
!51 = !DILocation(line: 48, column: 26, scope: !36)
!52 = !DILocation(line: 48, column: 19, scope: !36)
!53 = !DILocation(line: 48, column: 17, scope: !36)
!54 = !DILocation(line: 51, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !36, file: !14, line: 51, column: 9)
!56 = !DILocation(line: 51, column: 14, scope: !55)
!57 = !DILocation(line: 51, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !14, line: 51, column: 9)
!59 = !DILocation(line: 51, column: 25, scope: !58)
!60 = !DILocation(line: 51, column: 23, scope: !58)
!61 = !DILocation(line: 51, column: 9, scope: !55)
!62 = !DILocation(line: 53, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !14, line: 52, column: 9)
!64 = !DILocation(line: 53, column: 28, scope: !63)
!65 = !DILocation(line: 53, column: 18, scope: !63)
!66 = !DILocation(line: 53, column: 13, scope: !63)
!67 = !DILocation(line: 53, column: 21, scope: !63)
!68 = !DILocation(line: 54, column: 9, scope: !63)
!69 = !DILocation(line: 51, column: 35, scope: !58)
!70 = !DILocation(line: 51, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 54, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 55, column: 9, scope: !36)
!75 = !DILocation(line: 55, column: 21, scope: !36)
!76 = !DILocation(line: 56, column: 19, scope: !36)
!77 = !DILocation(line: 56, column: 9, scope: !36)
!78 = !DILocation(line: 58, column: 1, scope: !13)
!79 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_15_good", scope: !14, file: !14, line: 140, type: !15, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 142, column: 5, scope: !79)
!81 = !DILocation(line: 143, column: 5, scope: !79)
!82 = !DILocation(line: 144, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 156, type: !84, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !14, line: 156, type: !86)
!89 = !DILocation(line: 156, column: 14, scope: !83)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !14, line: 156, type: !87)
!91 = !DILocation(line: 156, column: 27, scope: !83)
!92 = !DILocation(line: 159, column: 22, scope: !83)
!93 = !DILocation(line: 159, column: 12, scope: !83)
!94 = !DILocation(line: 159, column: 5, scope: !83)
!95 = !DILocation(line: 161, column: 5, scope: !83)
!96 = !DILocation(line: 162, column: 5, scope: !83)
!97 = !DILocation(line: 163, column: 5, scope: !83)
!98 = !DILocation(line: 166, column: 5, scope: !83)
!99 = !DILocation(line: 167, column: 5, scope: !83)
!100 = !DILocation(line: 168, column: 5, scope: !83)
!101 = !DILocation(line: 170, column: 5, scope: !83)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !14, line: 67, type: !4)
!104 = !DILocation(line: 67, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !14, line: 68, type: !4)
!106 = !DILocation(line: 68, column: 12, scope: !102)
!107 = !DILocation(line: 68, column: 36, scope: !102)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !14, line: 69, type: !4)
!109 = !DILocation(line: 69, column: 12, scope: !102)
!110 = !DILocation(line: 69, column: 37, scope: !102)
!111 = !DILocation(line: 70, column: 12, scope: !102)
!112 = !DILocation(line: 70, column: 5, scope: !102)
!113 = !DILocation(line: 71, column: 5, scope: !102)
!114 = !DILocation(line: 71, column: 25, scope: !102)
!115 = !DILocation(line: 72, column: 12, scope: !102)
!116 = !DILocation(line: 72, column: 5, scope: !102)
!117 = !DILocation(line: 73, column: 5, scope: !102)
!118 = !DILocation(line: 73, column: 27, scope: !102)
!119 = !DILocation(line: 82, column: 16, scope: !102)
!120 = !DILocation(line: 82, column: 14, scope: !102)
!121 = !DILocalVariable(name: "i", scope: !122, file: !14, line: 86, type: !37)
!122 = distinct !DILexicalBlock(scope: !102, file: !14, line: 85, column: 5)
!123 = !DILocation(line: 86, column: 16, scope: !122)
!124 = !DILocalVariable(name: "destLen", scope: !122, file: !14, line: 86, type: !37)
!125 = !DILocation(line: 86, column: 19, scope: !122)
!126 = !DILocalVariable(name: "dest", scope: !122, file: !14, line: 87, type: !44)
!127 = !DILocation(line: 87, column: 14, scope: !122)
!128 = !DILocation(line: 88, column: 9, scope: !122)
!129 = !DILocation(line: 89, column: 9, scope: !122)
!130 = !DILocation(line: 89, column: 21, scope: !122)
!131 = !DILocation(line: 90, column: 26, scope: !122)
!132 = !DILocation(line: 90, column: 19, scope: !122)
!133 = !DILocation(line: 90, column: 17, scope: !122)
!134 = !DILocation(line: 93, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !122, file: !14, line: 93, column: 9)
!136 = !DILocation(line: 93, column: 14, scope: !135)
!137 = !DILocation(line: 93, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !14, line: 93, column: 9)
!139 = !DILocation(line: 93, column: 25, scope: !138)
!140 = !DILocation(line: 93, column: 23, scope: !138)
!141 = !DILocation(line: 93, column: 9, scope: !135)
!142 = !DILocation(line: 95, column: 23, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !14, line: 94, column: 9)
!144 = !DILocation(line: 95, column: 28, scope: !143)
!145 = !DILocation(line: 95, column: 18, scope: !143)
!146 = !DILocation(line: 95, column: 13, scope: !143)
!147 = !DILocation(line: 95, column: 21, scope: !143)
!148 = !DILocation(line: 96, column: 9, scope: !143)
!149 = !DILocation(line: 93, column: 35, scope: !138)
!150 = !DILocation(line: 93, column: 9, scope: !138)
!151 = distinct !{!151, !141, !152, !73}
!152 = !DILocation(line: 96, column: 9, scope: !135)
!153 = !DILocation(line: 97, column: 9, scope: !122)
!154 = !DILocation(line: 97, column: 21, scope: !122)
!155 = !DILocation(line: 98, column: 19, scope: !122)
!156 = !DILocation(line: 98, column: 9, scope: !122)
!157 = !DILocation(line: 100, column: 1, scope: !102)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 103, type: !15, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!159 = !DILocalVariable(name: "data", scope: !158, file: !14, line: 105, type: !4)
!160 = !DILocation(line: 105, column: 12, scope: !158)
!161 = !DILocalVariable(name: "dataBadBuffer", scope: !158, file: !14, line: 106, type: !4)
!162 = !DILocation(line: 106, column: 12, scope: !158)
!163 = !DILocation(line: 106, column: 36, scope: !158)
!164 = !DILocalVariable(name: "dataGoodBuffer", scope: !158, file: !14, line: 107, type: !4)
!165 = !DILocation(line: 107, column: 12, scope: !158)
!166 = !DILocation(line: 107, column: 37, scope: !158)
!167 = !DILocation(line: 108, column: 12, scope: !158)
!168 = !DILocation(line: 108, column: 5, scope: !158)
!169 = !DILocation(line: 109, column: 5, scope: !158)
!170 = !DILocation(line: 109, column: 25, scope: !158)
!171 = !DILocation(line: 110, column: 12, scope: !158)
!172 = !DILocation(line: 110, column: 5, scope: !158)
!173 = !DILocation(line: 111, column: 5, scope: !158)
!174 = !DILocation(line: 111, column: 27, scope: !158)
!175 = !DILocation(line: 116, column: 16, scope: !158)
!176 = !DILocation(line: 116, column: 14, scope: !158)
!177 = !DILocalVariable(name: "i", scope: !178, file: !14, line: 124, type: !37)
!178 = distinct !DILexicalBlock(scope: !158, file: !14, line: 123, column: 5)
!179 = !DILocation(line: 124, column: 16, scope: !178)
!180 = !DILocalVariable(name: "destLen", scope: !178, file: !14, line: 124, type: !37)
!181 = !DILocation(line: 124, column: 19, scope: !178)
!182 = !DILocalVariable(name: "dest", scope: !178, file: !14, line: 125, type: !44)
!183 = !DILocation(line: 125, column: 14, scope: !178)
!184 = !DILocation(line: 126, column: 9, scope: !178)
!185 = !DILocation(line: 127, column: 9, scope: !178)
!186 = !DILocation(line: 127, column: 21, scope: !178)
!187 = !DILocation(line: 128, column: 26, scope: !178)
!188 = !DILocation(line: 128, column: 19, scope: !178)
!189 = !DILocation(line: 128, column: 17, scope: !178)
!190 = !DILocation(line: 131, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !178, file: !14, line: 131, column: 9)
!192 = !DILocation(line: 131, column: 14, scope: !191)
!193 = !DILocation(line: 131, column: 21, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !14, line: 131, column: 9)
!195 = !DILocation(line: 131, column: 25, scope: !194)
!196 = !DILocation(line: 131, column: 23, scope: !194)
!197 = !DILocation(line: 131, column: 9, scope: !191)
!198 = !DILocation(line: 133, column: 23, scope: !199)
!199 = distinct !DILexicalBlock(scope: !194, file: !14, line: 132, column: 9)
!200 = !DILocation(line: 133, column: 28, scope: !199)
!201 = !DILocation(line: 133, column: 18, scope: !199)
!202 = !DILocation(line: 133, column: 13, scope: !199)
!203 = !DILocation(line: 133, column: 21, scope: !199)
!204 = !DILocation(line: 134, column: 9, scope: !199)
!205 = !DILocation(line: 131, column: 35, scope: !194)
!206 = !DILocation(line: 131, column: 9, scope: !194)
!207 = distinct !{!207, !197, !208, !73}
!208 = !DILocation(line: 134, column: 9, scope: !191)
!209 = !DILocation(line: 135, column: 9, scope: !178)
!210 = !DILocation(line: 135, column: 21, scope: !178)
!211 = !DILocation(line: 136, column: 19, scope: !178)
!212 = !DILocation(line: 136, column: 9, scope: !178)
!213 = !DILocation(line: 138, column: 1, scope: !158)
