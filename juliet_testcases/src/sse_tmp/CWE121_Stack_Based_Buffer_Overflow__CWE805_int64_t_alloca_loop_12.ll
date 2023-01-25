; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
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
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !34
  store i64* %4, i64** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !38
  store i64* %5, i64** %data, align 8, !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !56
  %cmp = icmp ult i64 %7, 100, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !62
  %9 = load i64, i64* %arrayidx, align 8, !dbg !62
  %10 = load i64*, i64** %data, align 8, !dbg !63
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !63
  store i64 %9, i64* %arrayidx1, align 8, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %12, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !72
  %arrayidx2 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !72
  %14 = load i64, i64* %arrayidx2, align 8, !dbg !72
  call void @printLongLongLine(i64 %14), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #5, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #5, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 400, align 16, !dbg !104
  %1 = bitcast i8* %0 to i64*, !dbg !105
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %2 = alloca i8, i64 800, align 16, !dbg !108
  %3 = bitcast i8* %2 to i64*, !dbg !109
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !107
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !113
  store i64* %4, i64** %data, align 8, !dbg !115
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !117
  store i64* %5, i64** %data, align 8, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %7, 100, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !135
  %9 = load i64, i64* %arrayidx, align 8, !dbg !135
  %10 = load i64*, i64** %data, align 8, !dbg !136
  %11 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx1 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !136
  store i64 %9, i64* %arrayidx1, align 8, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %12, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !144
  %14 = load i64, i64* %arrayidx2, align 8, !dbg !144
  call void @printLongLongLine(i64 %14), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 26, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !17, file: !18, line: 26, column: 8)
!33 = !DILocation(line: 26, column: 8, scope: !17)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !18, line: 27, column: 5)
!36 = !DILocation(line: 30, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 5, scope: !35)
!38 = !DILocation(line: 35, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !18, line: 33, column: 5)
!40 = !DILocation(line: 35, column: 14, scope: !39)
!41 = !DILocalVariable(name: "source", scope: !42, file: !18, line: 38, type: !43)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 37, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 38, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !48, file: !18, line: 40, type: !49)
!48 = distinct !DILexicalBlock(scope: !42, file: !18, line: 39, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 40, column: 20, scope: !48)
!53 = !DILocation(line: 42, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !18, line: 42, column: 13)
!55 = !DILocation(line: 42, column: 18, scope: !54)
!56 = !DILocation(line: 42, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !18, line: 42, column: 13)
!58 = !DILocation(line: 42, column: 27, scope: !57)
!59 = !DILocation(line: 42, column: 13, scope: !54)
!60 = !DILocation(line: 44, column: 34, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !18, line: 43, column: 13)
!62 = !DILocation(line: 44, column: 27, scope: !61)
!63 = !DILocation(line: 44, column: 17, scope: !61)
!64 = !DILocation(line: 44, column: 22, scope: !61)
!65 = !DILocation(line: 44, column: 25, scope: !61)
!66 = !DILocation(line: 45, column: 13, scope: !61)
!67 = !DILocation(line: 42, column: 35, scope: !57)
!68 = !DILocation(line: 42, column: 13, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 45, column: 13, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 46, column: 31, scope: !48)
!73 = !DILocation(line: 46, column: 13, scope: !48)
!74 = !DILocation(line: 49, column: 1, scope: !17)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_12_good", scope: !18, file: !18, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 88, column: 5, scope: !75)
!77 = !DILocation(line: 89, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 101, type: !79, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !18, line: 101, type: !81)
!86 = !DILocation(line: 101, column: 14, scope: !78)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !18, line: 101, type: !82)
!88 = !DILocation(line: 101, column: 27, scope: !78)
!89 = !DILocation(line: 104, column: 22, scope: !78)
!90 = !DILocation(line: 104, column: 12, scope: !78)
!91 = !DILocation(line: 104, column: 5, scope: !78)
!92 = !DILocation(line: 106, column: 5, scope: !78)
!93 = !DILocation(line: 107, column: 5, scope: !78)
!94 = !DILocation(line: 108, column: 5, scope: !78)
!95 = !DILocation(line: 111, column: 5, scope: !78)
!96 = !DILocation(line: 112, column: 5, scope: !78)
!97 = !DILocation(line: 113, column: 5, scope: !78)
!98 = !DILocation(line: 115, column: 5, scope: !78)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 57, type: !19, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !18, line: 59, type: !4)
!101 = !DILocation(line: 59, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !18, line: 60, type: !4)
!103 = !DILocation(line: 60, column: 15, scope: !99)
!104 = !DILocation(line: 60, column: 42, scope: !99)
!105 = !DILocation(line: 60, column: 31, scope: !99)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !18, line: 61, type: !4)
!107 = !DILocation(line: 61, column: 15, scope: !99)
!108 = !DILocation(line: 61, column: 43, scope: !99)
!109 = !DILocation(line: 61, column: 32, scope: !99)
!110 = !DILocation(line: 62, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !18, line: 62, column: 8)
!112 = !DILocation(line: 62, column: 8, scope: !99)
!113 = !DILocation(line: 65, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !18, line: 63, column: 5)
!115 = !DILocation(line: 65, column: 14, scope: !114)
!116 = !DILocation(line: 66, column: 5, scope: !114)
!117 = !DILocation(line: 70, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !18, line: 68, column: 5)
!119 = !DILocation(line: 70, column: 14, scope: !118)
!120 = !DILocalVariable(name: "source", scope: !121, file: !18, line: 73, type: !43)
!121 = distinct !DILexicalBlock(scope: !99, file: !18, line: 72, column: 5)
!122 = !DILocation(line: 73, column: 17, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !18, line: 75, type: !49)
!124 = distinct !DILexicalBlock(scope: !121, file: !18, line: 74, column: 9)
!125 = !DILocation(line: 75, column: 20, scope: !124)
!126 = !DILocation(line: 77, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !18, line: 77, column: 13)
!128 = !DILocation(line: 77, column: 18, scope: !127)
!129 = !DILocation(line: 77, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !18, line: 77, column: 13)
!131 = !DILocation(line: 77, column: 27, scope: !130)
!132 = !DILocation(line: 77, column: 13, scope: !127)
!133 = !DILocation(line: 79, column: 34, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !18, line: 78, column: 13)
!135 = !DILocation(line: 79, column: 27, scope: !134)
!136 = !DILocation(line: 79, column: 17, scope: !134)
!137 = !DILocation(line: 79, column: 22, scope: !134)
!138 = !DILocation(line: 79, column: 25, scope: !134)
!139 = !DILocation(line: 80, column: 13, scope: !134)
!140 = !DILocation(line: 77, column: 35, scope: !130)
!141 = !DILocation(line: 77, column: 13, scope: !130)
!142 = distinct !{!142, !132, !143, !71}
!143 = !DILocation(line: 80, column: 13, scope: !127)
!144 = !DILocation(line: 81, column: 31, scope: !124)
!145 = !DILocation(line: 81, column: 13, scope: !124)
!146 = !DILocation(line: 84, column: 1, scope: !99)
