; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_badSink(i64* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %1, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !44
  %3 = load i64, i64* %arrayidx, align 8, !dbg !44
  %4 = load i64*, i64** %data.addr, align 8, !dbg !45
  %5 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !45
  store i64 %3, i64* %arrayidx1, align 8, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %6, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !54
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !54
  call void @printLongLongLine(i64 %8), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_bad() #0 !dbg !57 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !62, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !69
  store i64* %arraydecay, i64** %data, align 8, !dbg !70
  %0 = load i64*, i64** %data, align 8, !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_badSink(i64* %0), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_goodG2BSink(i64* %data) #0 !dbg !74 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !86
  %cmp = icmp ult i64 %1, 100, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !92
  %3 = load i64, i64* %arrayidx, align 8, !dbg !92
  %4 = load i64*, i64** %data.addr, align 8, !dbg !93
  %5 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !93
  store i64 %3, i64* %arrayidx1, align 8, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %6, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !101
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !101
  call void @printLongLongLine(i64 %8), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_good() #0 !dbg !104 {
entry:
  call void @goodG2B(), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !107 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !114, metadata !DIExpression()), !dbg !115
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call i64 @time(i64* null) #5, !dbg !118
  %conv = trunc i64 %call to i32, !dbg !119
  call void @srand(i32 %conv) #5, !dbg !120
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !121
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_good(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !124
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_bad(), !dbg !125
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !126
  ret i32 0, !dbg !127
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !128 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !135
  store i64* %arraydecay, i64** %data, align 8, !dbg !136
  %0 = load i64*, i64** %data, align 8, !dbg !137
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_goodG2BSink(i64* %0), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_badSink", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !17, line: 27, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !19, line: 44, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!20 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 21, type: !15)
!22 = !DILocation(line: 21, column: 91, scope: !11)
!23 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 24, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 23, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 6400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 24, column: 17, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !30, file: !12, line: 26, type: !31)
!30 = distinct !DILexicalBlock(scope: !24, file: !12, line: 25, column: 9)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 26, column: 20, scope: !30)
!35 = !DILocation(line: 28, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !12, line: 28, column: 13)
!37 = !DILocation(line: 28, column: 18, scope: !36)
!38 = !DILocation(line: 28, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 28, column: 13)
!40 = !DILocation(line: 28, column: 27, scope: !39)
!41 = !DILocation(line: 28, column: 13, scope: !36)
!42 = !DILocation(line: 30, column: 34, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 29, column: 13)
!44 = !DILocation(line: 30, column: 27, scope: !43)
!45 = !DILocation(line: 30, column: 17, scope: !43)
!46 = !DILocation(line: 30, column: 22, scope: !43)
!47 = !DILocation(line: 30, column: 25, scope: !43)
!48 = !DILocation(line: 31, column: 13, scope: !43)
!49 = !DILocation(line: 28, column: 35, scope: !39)
!50 = !DILocation(line: 28, column: 13, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 31, column: 13, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 32, column: 31, scope: !30)
!55 = !DILocation(line: 32, column: 13, scope: !30)
!56 = !DILocation(line: 35, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_bad", scope: !12, file: !12, line: 37, type: !58, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !DILocalVariable(name: "data", scope: !57, file: !12, line: 39, type: !15)
!61 = !DILocation(line: 39, column: 15, scope: !57)
!62 = !DILocalVariable(name: "dataBadBuffer", scope: !57, file: !12, line: 40, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 50)
!66 = !DILocation(line: 40, column: 13, scope: !57)
!67 = !DILocalVariable(name: "dataGoodBuffer", scope: !57, file: !12, line: 41, type: !25)
!68 = !DILocation(line: 41, column: 13, scope: !57)
!69 = !DILocation(line: 44, column: 12, scope: !57)
!70 = !DILocation(line: 44, column: 10, scope: !57)
!71 = !DILocation(line: 45, column: 80, scope: !57)
!72 = !DILocation(line: 45, column: 5, scope: !57)
!73 = !DILocation(line: 46, column: 1, scope: !57)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", arg: 1, scope: !74, file: !12, line: 52, type: !15)
!76 = !DILocation(line: 52, column: 95, scope: !74)
!77 = !DILocalVariable(name: "source", scope: !78, file: !12, line: 55, type: !25)
!78 = distinct !DILexicalBlock(scope: !74, file: !12, line: 54, column: 5)
!79 = !DILocation(line: 55, column: 17, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !12, line: 57, type: !31)
!81 = distinct !DILexicalBlock(scope: !78, file: !12, line: 56, column: 9)
!82 = !DILocation(line: 57, column: 20, scope: !81)
!83 = !DILocation(line: 59, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !12, line: 59, column: 13)
!85 = !DILocation(line: 59, column: 18, scope: !84)
!86 = !DILocation(line: 59, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 59, column: 13)
!88 = !DILocation(line: 59, column: 27, scope: !87)
!89 = !DILocation(line: 59, column: 13, scope: !84)
!90 = !DILocation(line: 61, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !12, line: 60, column: 13)
!92 = !DILocation(line: 61, column: 27, scope: !91)
!93 = !DILocation(line: 61, column: 17, scope: !91)
!94 = !DILocation(line: 61, column: 22, scope: !91)
!95 = !DILocation(line: 61, column: 25, scope: !91)
!96 = !DILocation(line: 62, column: 13, scope: !91)
!97 = !DILocation(line: 59, column: 35, scope: !87)
!98 = !DILocation(line: 59, column: 13, scope: !87)
!99 = distinct !{!99, !89, !100, !53}
!100 = !DILocation(line: 62, column: 13, scope: !84)
!101 = !DILocation(line: 63, column: 31, scope: !81)
!102 = !DILocation(line: 63, column: 13, scope: !81)
!103 = !DILocation(line: 66, column: 1, scope: !74)
!104 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_good", scope: !12, file: !12, line: 79, type: !58, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocation(line: 81, column: 5, scope: !104)
!106 = !DILocation(line: 82, column: 1, scope: !104)
!107 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !108, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DISubroutineType(types: !109)
!109 = !{!110, !110, !111}
!110 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!114 = !DILocalVariable(name: "argc", arg: 1, scope: !107, file: !12, line: 94, type: !110)
!115 = !DILocation(line: 94, column: 14, scope: !107)
!116 = !DILocalVariable(name: "argv", arg: 2, scope: !107, file: !12, line: 94, type: !111)
!117 = !DILocation(line: 94, column: 27, scope: !107)
!118 = !DILocation(line: 97, column: 22, scope: !107)
!119 = !DILocation(line: 97, column: 12, scope: !107)
!120 = !DILocation(line: 97, column: 5, scope: !107)
!121 = !DILocation(line: 99, column: 5, scope: !107)
!122 = !DILocation(line: 100, column: 5, scope: !107)
!123 = !DILocation(line: 101, column: 5, scope: !107)
!124 = !DILocation(line: 104, column: 5, scope: !107)
!125 = !DILocation(line: 105, column: 5, scope: !107)
!126 = !DILocation(line: 106, column: 5, scope: !107)
!127 = !DILocation(line: 108, column: 5, scope: !107)
!128 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !58, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", scope: !128, file: !12, line: 71, type: !15)
!130 = !DILocation(line: 71, column: 15, scope: !128)
!131 = !DILocalVariable(name: "dataBadBuffer", scope: !128, file: !12, line: 72, type: !63)
!132 = !DILocation(line: 72, column: 13, scope: !128)
!133 = !DILocalVariable(name: "dataGoodBuffer", scope: !128, file: !12, line: 73, type: !25)
!134 = !DILocation(line: 73, column: 13, scope: !128)
!135 = !DILocation(line: 75, column: 12, scope: !128)
!136 = !DILocation(line: 75, column: 10, scope: !128)
!137 = !DILocation(line: 76, column: 84, scope: !128)
!138 = !DILocation(line: 76, column: 5, scope: !128)
!139 = !DILocation(line: 77, column: 1, scope: !128)
