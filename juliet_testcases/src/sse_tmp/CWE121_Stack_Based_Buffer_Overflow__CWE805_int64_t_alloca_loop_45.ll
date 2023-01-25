; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_goodG2BData = internal global i64* null, align 8, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to i64*, !dbg !35
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !36
  store i64* %4, i64** %data, align 8, !dbg !37
  %5 = load i64*, i64** %data, align 8, !dbg !38
  store i64* %5, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !66 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_badData, align 8, !dbg !69
  store i64* %0, i64** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !70, metadata !DIExpression()), !dbg !75
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !85
  %cmp = icmp ult i64 %2, 100, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !91
  %4 = load i64, i64* %arrayidx, align 8, !dbg !91
  %5 = load i64*, i64** %data, align 8, !dbg !92
  %6 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !92
  store i64 %4, i64* %arrayidx1, align 8, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %7, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !101
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !101
  call void @printLongLongLine(i64 %9), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i64*, !dbg !110
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 800, align 16, !dbg !113
  %3 = bitcast i8* %2 to i64*, !dbg !114
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !112
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !115
  store i64* %4, i64** %data, align 8, !dbg !116
  %5 = load i64*, i64** %data, align 8, !dbg !117
  store i64* %5, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_goodG2BData, align 8, !dbg !118
  call void @goodG2BSink(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !121 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_goodG2BData, align 8, !dbg !124
  store i64* %0, i64** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !134
  %cmp = icmp ult i64 %2, 100, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !140
  %4 = load i64, i64* %arrayidx, align 8, !dbg !140
  %5 = load i64*, i64** %data, align 8, !dbg !141
  %6 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !141
  store i64 %4, i64* %arrayidx1, align 8, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %7, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !149
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !149
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !149
  call void @printLongLongLine(i64 %9), !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_badData", scope: !2, file: !16, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 44, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_goodG2BData", scope: !2, file: !16, line: 20, type: !6, isLocal: true, isDefinition: true)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_bad", scope: !16, file: !16, line: 41, type: !24, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !16, line: 43, type: !6)
!27 = !DILocation(line: 43, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !16, line: 44, type: !6)
!29 = !DILocation(line: 44, column: 15, scope: !23)
!30 = !DILocation(line: 44, column: 42, scope: !23)
!31 = !DILocation(line: 44, column: 31, scope: !23)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !16, line: 45, type: !6)
!33 = !DILocation(line: 45, column: 15, scope: !23)
!34 = !DILocation(line: 45, column: 43, scope: !23)
!35 = !DILocation(line: 45, column: 32, scope: !23)
!36 = !DILocation(line: 48, column: 12, scope: !23)
!37 = !DILocation(line: 48, column: 10, scope: !23)
!38 = !DILocation(line: 49, column: 81, scope: !23)
!39 = !DILocation(line: 49, column: 79, scope: !23)
!40 = !DILocation(line: 50, column: 5, scope: !23)
!41 = !DILocation(line: 51, column: 1, scope: !23)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_45_good", scope: !16, file: !16, line: 86, type: !24, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 88, column: 5, scope: !42)
!44 = !DILocation(line: 89, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 100, type: !46, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !16, line: 100, type: !48)
!53 = !DILocation(line: 100, column: 14, scope: !45)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !16, line: 100, type: !49)
!55 = !DILocation(line: 100, column: 27, scope: !45)
!56 = !DILocation(line: 103, column: 22, scope: !45)
!57 = !DILocation(line: 103, column: 12, scope: !45)
!58 = !DILocation(line: 103, column: 5, scope: !45)
!59 = !DILocation(line: 105, column: 5, scope: !45)
!60 = !DILocation(line: 106, column: 5, scope: !45)
!61 = !DILocation(line: 107, column: 5, scope: !45)
!62 = !DILocation(line: 110, column: 5, scope: !45)
!63 = !DILocation(line: 111, column: 5, scope: !45)
!64 = !DILocation(line: 112, column: 5, scope: !45)
!65 = !DILocation(line: 114, column: 5, scope: !45)
!66 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 24, type: !24, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !16, line: 26, type: !6)
!68 = !DILocation(line: 26, column: 15, scope: !66)
!69 = !DILocation(line: 26, column: 22, scope: !66)
!70 = !DILocalVariable(name: "source", scope: !71, file: !16, line: 28, type: !72)
!71 = distinct !DILexicalBlock(scope: !66, file: !16, line: 27, column: 5)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 100)
!75 = !DILocation(line: 28, column: 17, scope: !71)
!76 = !DILocalVariable(name: "i", scope: !77, file: !16, line: 30, type: !78)
!77 = distinct !DILexicalBlock(scope: !71, file: !16, line: 29, column: 9)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !79, line: 46, baseType: !80)
!79 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!80 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!81 = !DILocation(line: 30, column: 20, scope: !77)
!82 = !DILocation(line: 32, column: 20, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !16, line: 32, column: 13)
!84 = !DILocation(line: 32, column: 18, scope: !83)
!85 = !DILocation(line: 32, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !16, line: 32, column: 13)
!87 = !DILocation(line: 32, column: 27, scope: !86)
!88 = !DILocation(line: 32, column: 13, scope: !83)
!89 = !DILocation(line: 34, column: 34, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !16, line: 33, column: 13)
!91 = !DILocation(line: 34, column: 27, scope: !90)
!92 = !DILocation(line: 34, column: 17, scope: !90)
!93 = !DILocation(line: 34, column: 22, scope: !90)
!94 = !DILocation(line: 34, column: 25, scope: !90)
!95 = !DILocation(line: 35, column: 13, scope: !90)
!96 = !DILocation(line: 32, column: 35, scope: !86)
!97 = !DILocation(line: 32, column: 13, scope: !86)
!98 = distinct !{!98, !88, !99, !100}
!99 = !DILocation(line: 35, column: 13, scope: !83)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocation(line: 36, column: 31, scope: !77)
!102 = !DILocation(line: 36, column: 13, scope: !77)
!103 = !DILocation(line: 39, column: 1, scope: !66)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 75, type: !24, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !16, line: 77, type: !6)
!106 = !DILocation(line: 77, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !16, line: 78, type: !6)
!108 = !DILocation(line: 78, column: 15, scope: !104)
!109 = !DILocation(line: 78, column: 42, scope: !104)
!110 = !DILocation(line: 78, column: 31, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !16, line: 79, type: !6)
!112 = !DILocation(line: 79, column: 15, scope: !104)
!113 = !DILocation(line: 79, column: 43, scope: !104)
!114 = !DILocation(line: 79, column: 32, scope: !104)
!115 = !DILocation(line: 81, column: 12, scope: !104)
!116 = !DILocation(line: 81, column: 10, scope: !104)
!117 = !DILocation(line: 82, column: 85, scope: !104)
!118 = !DILocation(line: 82, column: 83, scope: !104)
!119 = !DILocation(line: 83, column: 5, scope: !104)
!120 = !DILocation(line: 84, column: 1, scope: !104)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 58, type: !24, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", scope: !121, file: !16, line: 60, type: !6)
!123 = !DILocation(line: 60, column: 15, scope: !121)
!124 = !DILocation(line: 60, column: 22, scope: !121)
!125 = !DILocalVariable(name: "source", scope: !126, file: !16, line: 62, type: !72)
!126 = distinct !DILexicalBlock(scope: !121, file: !16, line: 61, column: 5)
!127 = !DILocation(line: 62, column: 17, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !129, file: !16, line: 64, type: !78)
!129 = distinct !DILexicalBlock(scope: !126, file: !16, line: 63, column: 9)
!130 = !DILocation(line: 64, column: 20, scope: !129)
!131 = !DILocation(line: 66, column: 20, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !16, line: 66, column: 13)
!133 = !DILocation(line: 66, column: 18, scope: !132)
!134 = !DILocation(line: 66, column: 25, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !16, line: 66, column: 13)
!136 = !DILocation(line: 66, column: 27, scope: !135)
!137 = !DILocation(line: 66, column: 13, scope: !132)
!138 = !DILocation(line: 68, column: 34, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !16, line: 67, column: 13)
!140 = !DILocation(line: 68, column: 27, scope: !139)
!141 = !DILocation(line: 68, column: 17, scope: !139)
!142 = !DILocation(line: 68, column: 22, scope: !139)
!143 = !DILocation(line: 68, column: 25, scope: !139)
!144 = !DILocation(line: 69, column: 13, scope: !139)
!145 = !DILocation(line: 66, column: 35, scope: !135)
!146 = !DILocation(line: 66, column: 13, scope: !135)
!147 = distinct !{!147, !137, !148, !100}
!148 = !DILocation(line: 69, column: 13, scope: !132)
!149 = !DILocation(line: 70, column: 31, scope: !129)
!150 = !DILocation(line: 70, column: 13, scope: !129)
!151 = !DILocation(line: 73, column: 1, scope: !121)
