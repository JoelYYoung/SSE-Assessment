; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
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
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !31
  store i64* %4, i64** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %5 = load i64*, i64** %data, align 8, !dbg !36
  store i64* %5, i64** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %6 = load i64*, i64** %dataCopy, align 8, !dbg !39
  store i64* %6, i64** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %8, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %9, !dbg !61
  %10 = load i64, i64* %arrayidx, align 8, !dbg !61
  %11 = load i64*, i64** %data1, align 8, !dbg !62
  %12 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i64, i64* %11, i64 %12, !dbg !62
  store i64 %10, i64* %arrayidx2, align 8, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %13, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %14 = load i64*, i64** %data1, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !71
  %15 = load i64, i64* %arrayidx3, align 8, !dbg !71
  call void @printLongLongLine(i64 %15), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 400, align 16, !dbg !103
  %1 = bitcast i8* %0 to i64*, !dbg !104
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %2 = alloca i8, i64 800, align 16, !dbg !107
  %3 = bitcast i8* %2 to i64*, !dbg !108
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !106
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !109
  store i64* %4, i64** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !111, metadata !DIExpression()), !dbg !113
  %5 = load i64*, i64** %data, align 8, !dbg !114
  store i64* %5, i64** %dataCopy, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !115, metadata !DIExpression()), !dbg !116
  %6 = load i64*, i64** %dataCopy, align 8, !dbg !117
  store i64* %6, i64** %data1, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %8, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %9, !dbg !133
  %10 = load i64, i64* %arrayidx, align 8, !dbg !133
  %11 = load i64*, i64** %data1, align 8, !dbg !134
  %12 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx2 = getelementptr inbounds i64, i64* %11, i64 %12, !dbg !134
  store i64 %10, i64* %arrayidx2, align 8, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %13, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %14 = load i64*, i64** %data1, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !142
  %15 = load i64, i64* %arrayidx3, align 8, !dbg !142
  call void @printLongLongLine(i64 %15), !dbg !143
  ret void, !dbg !144
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 28, column: 12, scope: !17)
!32 = !DILocation(line: 28, column: 10, scope: !17)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !18, line: 30, type: !4)
!34 = distinct !DILexicalBlock(scope: !17, file: !18, line: 29, column: 5)
!35 = !DILocation(line: 30, column: 19, scope: !34)
!36 = !DILocation(line: 30, column: 30, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !18, line: 31, type: !4)
!38 = !DILocation(line: 31, column: 19, scope: !34)
!39 = !DILocation(line: 31, column: 26, scope: !34)
!40 = !DILocalVariable(name: "source", scope: !41, file: !18, line: 33, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !18, line: 32, column: 9)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 33, column: 21, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !47, file: !18, line: 35, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !18, line: 34, column: 13)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 35, column: 24, scope: !47)
!52 = !DILocation(line: 37, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !18, line: 37, column: 17)
!54 = !DILocation(line: 37, column: 22, scope: !53)
!55 = !DILocation(line: 37, column: 29, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !18, line: 37, column: 17)
!57 = !DILocation(line: 37, column: 31, scope: !56)
!58 = !DILocation(line: 37, column: 17, scope: !53)
!59 = !DILocation(line: 39, column: 38, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !18, line: 38, column: 17)
!61 = !DILocation(line: 39, column: 31, scope: !60)
!62 = !DILocation(line: 39, column: 21, scope: !60)
!63 = !DILocation(line: 39, column: 26, scope: !60)
!64 = !DILocation(line: 39, column: 29, scope: !60)
!65 = !DILocation(line: 40, column: 17, scope: !60)
!66 = !DILocation(line: 37, column: 39, scope: !56)
!67 = !DILocation(line: 37, column: 17, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 40, column: 17, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 41, column: 35, scope: !47)
!72 = !DILocation(line: 41, column: 17, scope: !47)
!73 = !DILocation(line: 45, column: 1, scope: !17)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_31_good", scope: !18, file: !18, line: 77, type: !19, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 79, column: 5, scope: !74)
!76 = !DILocation(line: 80, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 91, type: !78, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !18, line: 91, type: !80)
!85 = !DILocation(line: 91, column: 14, scope: !77)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !18, line: 91, type: !81)
!87 = !DILocation(line: 91, column: 27, scope: !77)
!88 = !DILocation(line: 94, column: 22, scope: !77)
!89 = !DILocation(line: 94, column: 12, scope: !77)
!90 = !DILocation(line: 94, column: 5, scope: !77)
!91 = !DILocation(line: 96, column: 5, scope: !77)
!92 = !DILocation(line: 97, column: 5, scope: !77)
!93 = !DILocation(line: 98, column: 5, scope: !77)
!94 = !DILocation(line: 101, column: 5, scope: !77)
!95 = !DILocation(line: 102, column: 5, scope: !77)
!96 = !DILocation(line: 103, column: 5, scope: !77)
!97 = !DILocation(line: 105, column: 5, scope: !77)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 52, type: !19, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !18, line: 54, type: !4)
!100 = !DILocation(line: 54, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !18, line: 55, type: !4)
!102 = !DILocation(line: 55, column: 15, scope: !98)
!103 = !DILocation(line: 55, column: 42, scope: !98)
!104 = !DILocation(line: 55, column: 31, scope: !98)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !18, line: 56, type: !4)
!106 = !DILocation(line: 56, column: 15, scope: !98)
!107 = !DILocation(line: 56, column: 43, scope: !98)
!108 = !DILocation(line: 56, column: 32, scope: !98)
!109 = !DILocation(line: 58, column: 12, scope: !98)
!110 = !DILocation(line: 58, column: 10, scope: !98)
!111 = !DILocalVariable(name: "dataCopy", scope: !112, file: !18, line: 60, type: !4)
!112 = distinct !DILexicalBlock(scope: !98, file: !18, line: 59, column: 5)
!113 = !DILocation(line: 60, column: 19, scope: !112)
!114 = !DILocation(line: 60, column: 30, scope: !112)
!115 = !DILocalVariable(name: "data", scope: !112, file: !18, line: 61, type: !4)
!116 = !DILocation(line: 61, column: 19, scope: !112)
!117 = !DILocation(line: 61, column: 26, scope: !112)
!118 = !DILocalVariable(name: "source", scope: !119, file: !18, line: 63, type: !42)
!119 = distinct !DILexicalBlock(scope: !112, file: !18, line: 62, column: 9)
!120 = !DILocation(line: 63, column: 21, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !18, line: 65, type: !48)
!122 = distinct !DILexicalBlock(scope: !119, file: !18, line: 64, column: 13)
!123 = !DILocation(line: 65, column: 24, scope: !122)
!124 = !DILocation(line: 67, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !18, line: 67, column: 17)
!126 = !DILocation(line: 67, column: 22, scope: !125)
!127 = !DILocation(line: 67, column: 29, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !18, line: 67, column: 17)
!129 = !DILocation(line: 67, column: 31, scope: !128)
!130 = !DILocation(line: 67, column: 17, scope: !125)
!131 = !DILocation(line: 69, column: 38, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !18, line: 68, column: 17)
!133 = !DILocation(line: 69, column: 31, scope: !132)
!134 = !DILocation(line: 69, column: 21, scope: !132)
!135 = !DILocation(line: 69, column: 26, scope: !132)
!136 = !DILocation(line: 69, column: 29, scope: !132)
!137 = !DILocation(line: 70, column: 17, scope: !132)
!138 = !DILocation(line: 67, column: 39, scope: !128)
!139 = !DILocation(line: 67, column: 17, scope: !128)
!140 = distinct !{!140, !130, !141, !70}
!141 = !DILocation(line: 70, column: 17, scope: !125)
!142 = !DILocation(line: 71, column: 35, scope: !122)
!143 = !DILocation(line: 71, column: 17, scope: !122)
!144 = !DILocation(line: 75, column: 1, scope: !98)
