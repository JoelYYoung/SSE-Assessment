; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i64* %arraydecay, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i64*, i64** %data, align 8, !dbg !38
  store i64* %0, i64** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %1 = load i64*, i64** %dataCopy, align 8, !dbg !41
  store i64* %1, i64** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %3, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i64, i64* %arrayidx, align 8, !dbg !60
  %6 = load i64*, i64** %data1, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !61
  store i64 %5, i64* %arrayidx2, align 8, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data1, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !70
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !70
  call void @printLongLongLine(i64 %10), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i64* %arraydecay, i64** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !106, metadata !DIExpression()), !dbg !108
  %0 = load i64*, i64** %data, align 8, !dbg !109
  store i64* %0, i64** %dataCopy, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !110, metadata !DIExpression()), !dbg !111
  %1 = load i64*, i64** %dataCopy, align 8, !dbg !112
  store i64* %1, i64** %data1, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !122
  %cmp = icmp ult i64 %3, 100, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !128
  %5 = load i64, i64* %arrayidx, align 8, !dbg !128
  %6 = load i64*, i64** %data1, align 8, !dbg !129
  %7 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !129
  store i64 %5, i64* %arrayidx2, align 8, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %8, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data1, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !137
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !137
  call void @printLongLongLine(i64 %10), !dbg !138
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 24, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 25, column: 13, scope: !11)
!33 = !DILocation(line: 28, column: 12, scope: !11)
!34 = !DILocation(line: 28, column: 10, scope: !11)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !12, line: 30, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!37 = !DILocation(line: 30, column: 19, scope: !36)
!38 = !DILocation(line: 30, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 31, type: !16)
!40 = !DILocation(line: 31, column: 19, scope: !36)
!41 = !DILocation(line: 31, column: 26, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 33, type: !29)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 32, column: 9)
!44 = !DILocation(line: 33, column: 21, scope: !43)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 35, type: !47)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 34, column: 13)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 35, column: 24, scope: !46)
!51 = !DILocation(line: 37, column: 24, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !12, line: 37, column: 17)
!53 = !DILocation(line: 37, column: 22, scope: !52)
!54 = !DILocation(line: 37, column: 29, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 37, column: 17)
!56 = !DILocation(line: 37, column: 31, scope: !55)
!57 = !DILocation(line: 37, column: 17, scope: !52)
!58 = !DILocation(line: 39, column: 38, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 38, column: 17)
!60 = !DILocation(line: 39, column: 31, scope: !59)
!61 = !DILocation(line: 39, column: 21, scope: !59)
!62 = !DILocation(line: 39, column: 26, scope: !59)
!63 = !DILocation(line: 39, column: 29, scope: !59)
!64 = !DILocation(line: 40, column: 17, scope: !59)
!65 = !DILocation(line: 37, column: 39, scope: !55)
!66 = !DILocation(line: 37, column: 17, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 40, column: 17, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 41, column: 35, scope: !46)
!71 = !DILocation(line: 41, column: 17, scope: !46)
!72 = !DILocation(line: 45, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 79, column: 5, scope: !73)
!75 = !DILocation(line: 80, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !77, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 91, type: !79)
!84 = !DILocation(line: 91, column: 14, scope: !76)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 91, type: !80)
!86 = !DILocation(line: 91, column: 27, scope: !76)
!87 = !DILocation(line: 94, column: 22, scope: !76)
!88 = !DILocation(line: 94, column: 12, scope: !76)
!89 = !DILocation(line: 94, column: 5, scope: !76)
!90 = !DILocation(line: 96, column: 5, scope: !76)
!91 = !DILocation(line: 97, column: 5, scope: !76)
!92 = !DILocation(line: 98, column: 5, scope: !76)
!93 = !DILocation(line: 101, column: 5, scope: !76)
!94 = !DILocation(line: 102, column: 5, scope: !76)
!95 = !DILocation(line: 103, column: 5, scope: !76)
!96 = !DILocation(line: 105, column: 5, scope: !76)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 54, type: !16)
!99 = !DILocation(line: 54, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 55, type: !24)
!101 = !DILocation(line: 55, column: 13, scope: !97)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 56, type: !29)
!103 = !DILocation(line: 56, column: 13, scope: !97)
!104 = !DILocation(line: 58, column: 12, scope: !97)
!105 = !DILocation(line: 58, column: 10, scope: !97)
!106 = !DILocalVariable(name: "dataCopy", scope: !107, file: !12, line: 60, type: !16)
!107 = distinct !DILexicalBlock(scope: !97, file: !12, line: 59, column: 5)
!108 = !DILocation(line: 60, column: 19, scope: !107)
!109 = !DILocation(line: 60, column: 30, scope: !107)
!110 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 61, type: !16)
!111 = !DILocation(line: 61, column: 19, scope: !107)
!112 = !DILocation(line: 61, column: 26, scope: !107)
!113 = !DILocalVariable(name: "source", scope: !114, file: !12, line: 63, type: !29)
!114 = distinct !DILexicalBlock(scope: !107, file: !12, line: 62, column: 9)
!115 = !DILocation(line: 63, column: 21, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 65, type: !47)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 64, column: 13)
!118 = !DILocation(line: 65, column: 24, scope: !117)
!119 = !DILocation(line: 67, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 67, column: 17)
!121 = !DILocation(line: 67, column: 22, scope: !120)
!122 = !DILocation(line: 67, column: 29, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 67, column: 17)
!124 = !DILocation(line: 67, column: 31, scope: !123)
!125 = !DILocation(line: 67, column: 17, scope: !120)
!126 = !DILocation(line: 69, column: 38, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 68, column: 17)
!128 = !DILocation(line: 69, column: 31, scope: !127)
!129 = !DILocation(line: 69, column: 21, scope: !127)
!130 = !DILocation(line: 69, column: 26, scope: !127)
!131 = !DILocation(line: 69, column: 29, scope: !127)
!132 = !DILocation(line: 70, column: 17, scope: !127)
!133 = !DILocation(line: 67, column: 39, scope: !123)
!134 = !DILocation(line: 67, column: 17, scope: !123)
!135 = distinct !{!135, !125, !136, !69}
!136 = !DILocation(line: 70, column: 17, scope: !120)
!137 = !DILocation(line: 71, column: 35, scope: !117)
!138 = !DILocation(line: 71, column: 17, scope: !117)
!139 = !DILocation(line: 75, column: 1, scope: !97)
