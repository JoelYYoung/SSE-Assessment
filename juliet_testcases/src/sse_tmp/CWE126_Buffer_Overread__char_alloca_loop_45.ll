; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__char_alloca_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__char_alloca_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !31
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !35
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !38
  store i8* %6, i8** %data, align 8, !dbg !39
  %7 = load i8*, i8** %data, align 8, !dbg !40
  store i8* %7, i8** @CWE126_Buffer_Overread__char_alloca_loop_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #6, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #6, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__char_alloca_loop_45_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__char_alloca_loop_45_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_loop_45_badData, align 8, !dbg !69
  store i8* %0, i8** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64* %i, metadata !70, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !83
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !87
  store i64 %call, i64* %destLen, align 8, !dbg !88
  store i64 0, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !92
  %2 = load i64, i64* %destLen, align 8, !dbg !94
  %cmp = icmp ult i64 %1, %2, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !97
  %4 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !97
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !97
  %6 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !101
  store i8 %5, i8* %arrayidx3, align 1, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %7, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx4, align 1, !dbg !110
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  call void @printLine(i8* %arraydecay5), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 50, align 16, !dbg !119
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %1 = alloca i8, i64 100, align 16, !dbg !122
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !121
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !124
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !128
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !129
  store i8 0, i8* %arrayidx1, align 1, !dbg !130
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !131
  store i8* %6, i8** %data, align 8, !dbg !132
  %7 = load i8*, i8** %data, align 8, !dbg !133
  store i8* %7, i8** @CWE126_Buffer_Overread__char_alloca_loop_45_goodG2BData, align 8, !dbg !134
  call void @goodG2BSink(), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !137 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !138, metadata !DIExpression()), !dbg !139
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_loop_45_goodG2BData, align 8, !dbg !140
  store i8* %0, i8** %data, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !148
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !151
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !152
  store i64 %call, i64* %destLen, align 8, !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !157
  %2 = load i64, i64* %destLen, align 8, !dbg !159
  %cmp = icmp ult i64 %1, %2, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !162
  %4 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !162
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !162
  %6 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !166
  store i8 %5, i8* %arrayidx3, align 1, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %7, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !173
  store i8 0, i8* %arrayidx4, align 1, !dbg !174
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !175
  call void @printLine(i8* %arraydecay5), !dbg !176
  ret void, !dbg !177
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_alloca_loop_45_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_alloca_loop_45_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_45_bad", scope: !12, file: !12, line: 46, type: !20, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 48, type: !6)
!23 = !DILocation(line: 48, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 49, type: !6)
!25 = !DILocation(line: 49, column: 12, scope: !19)
!26 = !DILocation(line: 49, column: 36, scope: !19)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 50, type: !6)
!28 = !DILocation(line: 50, column: 12, scope: !19)
!29 = !DILocation(line: 50, column: 37, scope: !19)
!30 = !DILocation(line: 51, column: 12, scope: !19)
!31 = !DILocation(line: 51, column: 5, scope: !19)
!32 = !DILocation(line: 52, column: 5, scope: !19)
!33 = !DILocation(line: 52, column: 25, scope: !19)
!34 = !DILocation(line: 53, column: 12, scope: !19)
!35 = !DILocation(line: 53, column: 5, scope: !19)
!36 = !DILocation(line: 54, column: 5, scope: !19)
!37 = !DILocation(line: 54, column: 27, scope: !19)
!38 = !DILocation(line: 56, column: 12, scope: !19)
!39 = !DILocation(line: 56, column: 10, scope: !19)
!40 = !DILocation(line: 57, column: 59, scope: !19)
!41 = !DILocation(line: 57, column: 57, scope: !19)
!42 = !DILocation(line: 58, column: 5, scope: !19)
!43 = !DILocation(line: 59, column: 1, scope: !19)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_45_good", scope: !12, file: !12, line: 101, type: !20, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 103, column: 5, scope: !44)
!46 = !DILocation(line: 104, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !48, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !12, line: 115, type: !50)
!53 = !DILocation(line: 115, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !12, line: 115, type: !51)
!55 = !DILocation(line: 115, column: 27, scope: !47)
!56 = !DILocation(line: 118, column: 22, scope: !47)
!57 = !DILocation(line: 118, column: 12, scope: !47)
!58 = !DILocation(line: 118, column: 5, scope: !47)
!59 = !DILocation(line: 120, column: 5, scope: !47)
!60 = !DILocation(line: 121, column: 5, scope: !47)
!61 = !DILocation(line: 122, column: 5, scope: !47)
!62 = !DILocation(line: 125, column: 5, scope: !47)
!63 = !DILocation(line: 126, column: 5, scope: !47)
!64 = !DILocation(line: 127, column: 5, scope: !47)
!65 = !DILocation(line: 129, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 28, type: !6)
!68 = !DILocation(line: 28, column: 12, scope: !66)
!69 = !DILocation(line: 28, column: 19, scope: !66)
!70 = !DILocalVariable(name: "i", scope: !71, file: !12, line: 30, type: !72)
!71 = distinct !DILexicalBlock(scope: !66, file: !12, line: 29, column: 5)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !73, line: 46, baseType: !74)
!73 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!74 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!75 = !DILocation(line: 30, column: 16, scope: !71)
!76 = !DILocalVariable(name: "destLen", scope: !71, file: !12, line: 30, type: !72)
!77 = !DILocation(line: 30, column: 19, scope: !71)
!78 = !DILocalVariable(name: "dest", scope: !71, file: !12, line: 31, type: !79)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 100)
!82 = !DILocation(line: 31, column: 14, scope: !71)
!83 = !DILocation(line: 32, column: 9, scope: !71)
!84 = !DILocation(line: 33, column: 9, scope: !71)
!85 = !DILocation(line: 33, column: 21, scope: !71)
!86 = !DILocation(line: 34, column: 26, scope: !71)
!87 = !DILocation(line: 34, column: 19, scope: !71)
!88 = !DILocation(line: 34, column: 17, scope: !71)
!89 = !DILocation(line: 37, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !71, file: !12, line: 37, column: 9)
!91 = !DILocation(line: 37, column: 14, scope: !90)
!92 = !DILocation(line: 37, column: 21, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 37, column: 9)
!94 = !DILocation(line: 37, column: 25, scope: !93)
!95 = !DILocation(line: 37, column: 23, scope: !93)
!96 = !DILocation(line: 37, column: 9, scope: !90)
!97 = !DILocation(line: 39, column: 23, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !12, line: 38, column: 9)
!99 = !DILocation(line: 39, column: 28, scope: !98)
!100 = !DILocation(line: 39, column: 18, scope: !98)
!101 = !DILocation(line: 39, column: 13, scope: !98)
!102 = !DILocation(line: 39, column: 21, scope: !98)
!103 = !DILocation(line: 40, column: 9, scope: !98)
!104 = !DILocation(line: 37, column: 35, scope: !93)
!105 = !DILocation(line: 37, column: 9, scope: !93)
!106 = distinct !{!106, !96, !107, !108}
!107 = !DILocation(line: 40, column: 9, scope: !90)
!108 = !{!"llvm.loop.mustprogress"}
!109 = !DILocation(line: 41, column: 9, scope: !71)
!110 = !DILocation(line: 41, column: 21, scope: !71)
!111 = !DILocation(line: 42, column: 19, scope: !71)
!112 = !DILocation(line: 42, column: 9, scope: !71)
!113 = !DILocation(line: 44, column: 1, scope: !66)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 88, type: !6)
!116 = !DILocation(line: 88, column: 12, scope: !114)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !12, line: 89, type: !6)
!118 = !DILocation(line: 89, column: 12, scope: !114)
!119 = !DILocation(line: 89, column: 36, scope: !114)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !12, line: 90, type: !6)
!121 = !DILocation(line: 90, column: 12, scope: !114)
!122 = !DILocation(line: 90, column: 37, scope: !114)
!123 = !DILocation(line: 91, column: 12, scope: !114)
!124 = !DILocation(line: 91, column: 5, scope: !114)
!125 = !DILocation(line: 92, column: 5, scope: !114)
!126 = !DILocation(line: 92, column: 25, scope: !114)
!127 = !DILocation(line: 93, column: 12, scope: !114)
!128 = !DILocation(line: 93, column: 5, scope: !114)
!129 = !DILocation(line: 94, column: 5, scope: !114)
!130 = !DILocation(line: 94, column: 27, scope: !114)
!131 = !DILocation(line: 96, column: 12, scope: !114)
!132 = !DILocation(line: 96, column: 10, scope: !114)
!133 = !DILocation(line: 97, column: 63, scope: !114)
!134 = !DILocation(line: 97, column: 61, scope: !114)
!135 = !DILocation(line: 98, column: 5, scope: !114)
!136 = !DILocation(line: 99, column: 1, scope: !114)
!137 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!138 = !DILocalVariable(name: "data", scope: !137, file: !12, line: 68, type: !6)
!139 = !DILocation(line: 68, column: 12, scope: !137)
!140 = !DILocation(line: 68, column: 19, scope: !137)
!141 = !DILocalVariable(name: "i", scope: !142, file: !12, line: 70, type: !72)
!142 = distinct !DILexicalBlock(scope: !137, file: !12, line: 69, column: 5)
!143 = !DILocation(line: 70, column: 16, scope: !142)
!144 = !DILocalVariable(name: "destLen", scope: !142, file: !12, line: 70, type: !72)
!145 = !DILocation(line: 70, column: 19, scope: !142)
!146 = !DILocalVariable(name: "dest", scope: !142, file: !12, line: 71, type: !79)
!147 = !DILocation(line: 71, column: 14, scope: !142)
!148 = !DILocation(line: 72, column: 9, scope: !142)
!149 = !DILocation(line: 73, column: 9, scope: !142)
!150 = !DILocation(line: 73, column: 21, scope: !142)
!151 = !DILocation(line: 74, column: 26, scope: !142)
!152 = !DILocation(line: 74, column: 19, scope: !142)
!153 = !DILocation(line: 74, column: 17, scope: !142)
!154 = !DILocation(line: 77, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !142, file: !12, line: 77, column: 9)
!156 = !DILocation(line: 77, column: 14, scope: !155)
!157 = !DILocation(line: 77, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !12, line: 77, column: 9)
!159 = !DILocation(line: 77, column: 25, scope: !158)
!160 = !DILocation(line: 77, column: 23, scope: !158)
!161 = !DILocation(line: 77, column: 9, scope: !155)
!162 = !DILocation(line: 79, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !12, line: 78, column: 9)
!164 = !DILocation(line: 79, column: 28, scope: !163)
!165 = !DILocation(line: 79, column: 18, scope: !163)
!166 = !DILocation(line: 79, column: 13, scope: !163)
!167 = !DILocation(line: 79, column: 21, scope: !163)
!168 = !DILocation(line: 80, column: 9, scope: !163)
!169 = !DILocation(line: 77, column: 35, scope: !158)
!170 = !DILocation(line: 77, column: 9, scope: !158)
!171 = distinct !{!171, !161, !172, !108}
!172 = !DILocation(line: 80, column: 9, scope: !155)
!173 = !DILocation(line: 81, column: 9, scope: !142)
!174 = !DILocation(line: 81, column: 21, scope: !142)
!175 = !DILocation(line: 82, column: 19, scope: !142)
!176 = !DILocation(line: 82, column: 9, scope: !142)
!177 = !DILocation(line: 84, column: 1, scope: !137)
