; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source1 = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i64*, !dbg !26
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 800, align 16, !dbg !29
  %3 = bitcast i8* %2 to i64*, !dbg !30
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !28
  br label %source, !dbg !31

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !32), !dbg !33
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !34
  store i64* %4, i64** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i64]* %source1, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [100 x i64]* %source1 to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %6, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source1, i64 0, i64 %7, !dbg !57
  %8 = load i64, i64* %arrayidx, align 8, !dbg !57
  %9 = load i64*, i64** %data, align 8, !dbg !58
  %10 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !58
  store i64 %8, i64* %arrayidx2, align 8, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %11, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !67
  %13 = load i64, i64* %arrayidx3, align 8, !dbg !67
  call void @printLongLongLine(i64 %13), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source1 = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 400, align 16, !dbg !99
  %1 = bitcast i8* %0 to i64*, !dbg !100
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %2 = alloca i8, i64 800, align 16, !dbg !103
  %3 = bitcast i8* %2 to i64*, !dbg !104
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !102
  br label %source, !dbg !105

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !106), !dbg !107
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !108
  store i64* %4, i64** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i64]* %source1, metadata !110, metadata !DIExpression()), !dbg !112
  %5 = bitcast [100 x i64]* %source1 to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !119
  %cmp = icmp ult i64 %6, 100, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source1, i64 0, i64 %7, !dbg !125
  %8 = load i64, i64* %arrayidx, align 8, !dbg !125
  %9 = load i64*, i64** %data, align 8, !dbg !126
  %10 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !126
  store i64 %8, i64* %arrayidx2, align 8, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %11, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !134
  %13 = load i64, i64* %arrayidx3, align 8, !dbg !134
  call void @printLongLongLine(i64 %13), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 23, type: !4)
!22 = !DILocation(line: 23, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 24, type: !4)
!24 = !DILocation(line: 24, column: 15, scope: !17)
!25 = !DILocation(line: 24, column: 42, scope: !17)
!26 = !DILocation(line: 24, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 25, type: !4)
!28 = !DILocation(line: 25, column: 15, scope: !17)
!29 = !DILocation(line: 25, column: 43, scope: !17)
!30 = !DILocation(line: 25, column: 32, scope: !17)
!31 = !DILocation(line: 26, column: 5, scope: !17)
!32 = !DILabel(scope: !17, name: "source", file: !18, line: 27)
!33 = !DILocation(line: 27, column: 1, scope: !17)
!34 = !DILocation(line: 30, column: 12, scope: !17)
!35 = !DILocation(line: 30, column: 10, scope: !17)
!36 = !DILocalVariable(name: "source", scope: !37, file: !18, line: 32, type: !38)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 31, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 32, column: 17, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !18, line: 34, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !18, line: 33, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 34, column: 20, scope: !43)
!48 = !DILocation(line: 36, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !18, line: 36, column: 13)
!50 = !DILocation(line: 36, column: 18, scope: !49)
!51 = !DILocation(line: 36, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !18, line: 36, column: 13)
!53 = !DILocation(line: 36, column: 27, scope: !52)
!54 = !DILocation(line: 36, column: 13, scope: !49)
!55 = !DILocation(line: 38, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !18, line: 37, column: 13)
!57 = !DILocation(line: 38, column: 27, scope: !56)
!58 = !DILocation(line: 38, column: 17, scope: !56)
!59 = !DILocation(line: 38, column: 22, scope: !56)
!60 = !DILocation(line: 38, column: 25, scope: !56)
!61 = !DILocation(line: 39, column: 13, scope: !56)
!62 = !DILocation(line: 36, column: 35, scope: !52)
!63 = !DILocation(line: 36, column: 13, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 39, column: 13, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 40, column: 31, scope: !43)
!68 = !DILocation(line: 40, column: 13, scope: !43)
!69 = !DILocation(line: 43, column: 1, scope: !17)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_18_good", scope: !18, file: !18, line: 73, type: !19, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 75, column: 5, scope: !70)
!72 = !DILocation(line: 76, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 88, type: !74, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !18, line: 88, type: !76)
!81 = !DILocation(line: 88, column: 14, scope: !73)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !18, line: 88, type: !77)
!83 = !DILocation(line: 88, column: 27, scope: !73)
!84 = !DILocation(line: 91, column: 22, scope: !73)
!85 = !DILocation(line: 91, column: 12, scope: !73)
!86 = !DILocation(line: 91, column: 5, scope: !73)
!87 = !DILocation(line: 93, column: 5, scope: !73)
!88 = !DILocation(line: 94, column: 5, scope: !73)
!89 = !DILocation(line: 95, column: 5, scope: !73)
!90 = !DILocation(line: 98, column: 5, scope: !73)
!91 = !DILocation(line: 99, column: 5, scope: !73)
!92 = !DILocation(line: 100, column: 5, scope: !73)
!93 = !DILocation(line: 102, column: 5, scope: !73)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 50, type: !19, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !18, line: 52, type: !4)
!96 = !DILocation(line: 52, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !18, line: 53, type: !4)
!98 = !DILocation(line: 53, column: 15, scope: !94)
!99 = !DILocation(line: 53, column: 42, scope: !94)
!100 = !DILocation(line: 53, column: 31, scope: !94)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !18, line: 54, type: !4)
!102 = !DILocation(line: 54, column: 15, scope: !94)
!103 = !DILocation(line: 54, column: 43, scope: !94)
!104 = !DILocation(line: 54, column: 32, scope: !94)
!105 = !DILocation(line: 55, column: 5, scope: !94)
!106 = !DILabel(scope: !94, name: "source", file: !18, line: 56)
!107 = !DILocation(line: 56, column: 1, scope: !94)
!108 = !DILocation(line: 58, column: 12, scope: !94)
!109 = !DILocation(line: 58, column: 10, scope: !94)
!110 = !DILocalVariable(name: "source", scope: !111, file: !18, line: 60, type: !38)
!111 = distinct !DILexicalBlock(scope: !94, file: !18, line: 59, column: 5)
!112 = !DILocation(line: 60, column: 17, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !114, file: !18, line: 62, type: !44)
!114 = distinct !DILexicalBlock(scope: !111, file: !18, line: 61, column: 9)
!115 = !DILocation(line: 62, column: 20, scope: !114)
!116 = !DILocation(line: 64, column: 20, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !18, line: 64, column: 13)
!118 = !DILocation(line: 64, column: 18, scope: !117)
!119 = !DILocation(line: 64, column: 25, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !18, line: 64, column: 13)
!121 = !DILocation(line: 64, column: 27, scope: !120)
!122 = !DILocation(line: 64, column: 13, scope: !117)
!123 = !DILocation(line: 66, column: 34, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !18, line: 65, column: 13)
!125 = !DILocation(line: 66, column: 27, scope: !124)
!126 = !DILocation(line: 66, column: 17, scope: !124)
!127 = !DILocation(line: 66, column: 22, scope: !124)
!128 = !DILocation(line: 66, column: 25, scope: !124)
!129 = !DILocation(line: 67, column: 13, scope: !124)
!130 = !DILocation(line: 64, column: 35, scope: !120)
!131 = !DILocation(line: 64, column: 13, scope: !120)
!132 = distinct !{!132, !122, !133, !66}
!133 = !DILocation(line: 67, column: 13, scope: !117)
!134 = !DILocation(line: 68, column: 31, scope: !114)
!135 = !DILocation(line: 68, column: 13, scope: !114)
!136 = !DILocation(line: 71, column: 1, scope: !94)
