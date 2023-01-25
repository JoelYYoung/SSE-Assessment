; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  store i32* %4, i32** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !34
  store i32* %5, i32** %data, align 8, !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %7, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !58
  %9 = load i32, i32* %arrayidx, align 4, !dbg !58
  %10 = load i32*, i32** %data, align 8, !dbg !59
  %11 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !59
  store i32 %9, i32* %arrayidx1, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %12, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !68
  %14 = load i32, i32* %arrayidx2, align 4, !dbg !68
  call void @printIntLine(i32 %14), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 200, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %2 = alloca i8, i64 400, align 16, !dbg !103
  %3 = bitcast i8* %2 to i32*, !dbg !104
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !102
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !105
  %tobool = icmp ne i32 %call, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !108
  store i32* %4, i32** %data, align 8, !dbg !110
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !112
  store i32* %5, i32** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !124
  %cmp = icmp ult i64 %7, 100, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !130
  %9 = load i32, i32* %arrayidx, align 4, !dbg !130
  %10 = load i32*, i32** %data, align 8, !dbg !131
  %11 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx1 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !131
  store i32 %9, i32* %arrayidx1, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %12, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !139
  %14 = load i32, i32* %arrayidx2, align 4, !dbg !139
  call void @printIntLine(i32 %14), !dbg !140
  ret void, !dbg !141
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 26, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!29 = !DILocation(line: 26, column: 8, scope: !13)
!30 = !DILocation(line: 30, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !14, line: 27, column: 5)
!32 = !DILocation(line: 30, column: 14, scope: !31)
!33 = !DILocation(line: 31, column: 5, scope: !31)
!34 = !DILocation(line: 35, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !14, line: 33, column: 5)
!36 = !DILocation(line: 35, column: 14, scope: !35)
!37 = !DILocalVariable(name: "source", scope: !38, file: !14, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 38, column: 13, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !14, line: 40, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !14, line: 39, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 40, column: 20, scope: !44)
!49 = !DILocation(line: 42, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !14, line: 42, column: 13)
!51 = !DILocation(line: 42, column: 18, scope: !50)
!52 = !DILocation(line: 42, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !14, line: 42, column: 13)
!54 = !DILocation(line: 42, column: 27, scope: !53)
!55 = !DILocation(line: 42, column: 13, scope: !50)
!56 = !DILocation(line: 44, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !14, line: 43, column: 13)
!58 = !DILocation(line: 44, column: 27, scope: !57)
!59 = !DILocation(line: 44, column: 17, scope: !57)
!60 = !DILocation(line: 44, column: 22, scope: !57)
!61 = !DILocation(line: 44, column: 25, scope: !57)
!62 = !DILocation(line: 45, column: 13, scope: !57)
!63 = !DILocation(line: 42, column: 35, scope: !53)
!64 = !DILocation(line: 42, column: 13, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 45, column: 13, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 46, column: 26, scope: !44)
!69 = !DILocation(line: 46, column: 13, scope: !44)
!70 = !DILocation(line: 49, column: 1, scope: !13)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_12_good", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 88, column: 5, scope: !71)
!73 = !DILocation(line: 89, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 101, type: !75, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!5, !5, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !14, line: 101, type: !5)
!81 = !DILocation(line: 101, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !14, line: 101, type: !77)
!83 = !DILocation(line: 101, column: 27, scope: !74)
!84 = !DILocation(line: 104, column: 22, scope: !74)
!85 = !DILocation(line: 104, column: 12, scope: !74)
!86 = !DILocation(line: 104, column: 5, scope: !74)
!87 = !DILocation(line: 106, column: 5, scope: !74)
!88 = !DILocation(line: 107, column: 5, scope: !74)
!89 = !DILocation(line: 108, column: 5, scope: !74)
!90 = !DILocation(line: 111, column: 5, scope: !74)
!91 = !DILocation(line: 112, column: 5, scope: !74)
!92 = !DILocation(line: 113, column: 5, scope: !74)
!93 = !DILocation(line: 115, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 59, type: !4)
!96 = !DILocation(line: 59, column: 11, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !14, line: 60, type: !4)
!98 = !DILocation(line: 60, column: 11, scope: !94)
!99 = !DILocation(line: 60, column: 34, scope: !94)
!100 = !DILocation(line: 60, column: 27, scope: !94)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !14, line: 61, type: !4)
!102 = !DILocation(line: 61, column: 11, scope: !94)
!103 = !DILocation(line: 61, column: 35, scope: !94)
!104 = !DILocation(line: 61, column: 28, scope: !94)
!105 = !DILocation(line: 62, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !94, file: !14, line: 62, column: 8)
!107 = !DILocation(line: 62, column: 8, scope: !94)
!108 = !DILocation(line: 65, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !14, line: 63, column: 5)
!110 = !DILocation(line: 65, column: 14, scope: !109)
!111 = !DILocation(line: 66, column: 5, scope: !109)
!112 = !DILocation(line: 70, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !14, line: 68, column: 5)
!114 = !DILocation(line: 70, column: 14, scope: !113)
!115 = !DILocalVariable(name: "source", scope: !116, file: !14, line: 73, type: !39)
!116 = distinct !DILexicalBlock(scope: !94, file: !14, line: 72, column: 5)
!117 = !DILocation(line: 73, column: 13, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !14, line: 75, type: !45)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 74, column: 9)
!120 = !DILocation(line: 75, column: 20, scope: !119)
!121 = !DILocation(line: 77, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !14, line: 77, column: 13)
!123 = !DILocation(line: 77, column: 18, scope: !122)
!124 = !DILocation(line: 77, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !14, line: 77, column: 13)
!126 = !DILocation(line: 77, column: 27, scope: !125)
!127 = !DILocation(line: 77, column: 13, scope: !122)
!128 = !DILocation(line: 79, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !14, line: 78, column: 13)
!130 = !DILocation(line: 79, column: 27, scope: !129)
!131 = !DILocation(line: 79, column: 17, scope: !129)
!132 = !DILocation(line: 79, column: 22, scope: !129)
!133 = !DILocation(line: 79, column: 25, scope: !129)
!134 = !DILocation(line: 80, column: 13, scope: !129)
!135 = !DILocation(line: 77, column: 35, scope: !125)
!136 = !DILocation(line: 77, column: 13, scope: !125)
!137 = distinct !{!137, !127, !138, !67}
!138 = !DILocation(line: 80, column: 13, scope: !122)
!139 = !DILocation(line: 81, column: 26, scope: !119)
!140 = !DILocation(line: 81, column: 13, scope: !119)
!141 = !DILocation(line: 84, column: 1, scope: !94)
