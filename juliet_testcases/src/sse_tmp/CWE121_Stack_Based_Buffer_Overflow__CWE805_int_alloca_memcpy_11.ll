; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  store i32* %4, i32** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %7 = bitcast i32* %6 to i8*, !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %8 = bitcast i32* %arraydecay to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !41
  %9 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !42
  %10 = load i32, i32* %arrayidx, align 4, !dbg !42
  call void @printIntLine(i32 %10), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 200, align 16, !dbg !74
  %1 = bitcast i8* %0 to i32*, !dbg !75
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = alloca i8, i64 400, align 16, !dbg !78
  %3 = bitcast i8* %2 to i32*, !dbg !79
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !77
  %call = call i32 (...) @globalReturnsFalse(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !86
  store i32* %4, i32** %data, align 8, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !91
  %6 = load i32*, i32** %data, align 8, !dbg !92
  %7 = bitcast i32* %6 to i8*, !dbg !93
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !93
  %8 = bitcast i32* %arraydecay to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !93
  %9 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !94
  %10 = load i32, i32* %arrayidx, align 4, !dbg !94
  call void @printIntLine(i32 %10), !dbg !95
  ret void, !dbg !96
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 200, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %2 = alloca i8, i64 400, align 16, !dbg !106
  %3 = bitcast i8* %2 to i32*, !dbg !107
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !105
  %call = call i32 (...) @globalReturnsTrue(), !dbg !108
  %tobool = icmp ne i32 %call, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !111
  store i32* %4, i32** %data, align 8, !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !117
  %6 = load i32*, i32** %data, align 8, !dbg !118
  %7 = bitcast i32* %6 to i8*, !dbg !119
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !119
  %8 = bitcast i32* %arraydecay to i8*, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !119
  %9 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !120
  %10 = load i32, i32* %arrayidx, align 4, !dbg !120
  call void @printIntLine(i32 %10), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 33, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 33, column: 13, scope: !35)
!40 = !DILocation(line: 35, column: 16, scope: !35)
!41 = !DILocation(line: 35, column: 9, scope: !35)
!42 = !DILocation(line: 36, column: 22, scope: !35)
!43 = !DILocation(line: 36, column: 9, scope: !35)
!44 = !DILocation(line: 38, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_11_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 89, column: 5, scope: !45)
!47 = !DILocation(line: 90, column: 5, scope: !45)
!48 = !DILocation(line: 91, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 103, type: !50, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!5, !5, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !14, line: 103, type: !5)
!56 = !DILocation(line: 103, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !14, line: 103, type: !52)
!58 = !DILocation(line: 103, column: 27, scope: !49)
!59 = !DILocation(line: 106, column: 22, scope: !49)
!60 = !DILocation(line: 106, column: 12, scope: !49)
!61 = !DILocation(line: 106, column: 5, scope: !49)
!62 = !DILocation(line: 108, column: 5, scope: !49)
!63 = !DILocation(line: 109, column: 5, scope: !49)
!64 = !DILocation(line: 110, column: 5, scope: !49)
!65 = !DILocation(line: 113, column: 5, scope: !49)
!66 = !DILocation(line: 114, column: 5, scope: !49)
!67 = !DILocation(line: 115, column: 5, scope: !49)
!68 = !DILocation(line: 117, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 45, type: !15, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 47, type: !4)
!71 = !DILocation(line: 47, column: 11, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !14, line: 48, type: !4)
!73 = !DILocation(line: 48, column: 11, scope: !69)
!74 = !DILocation(line: 48, column: 34, scope: !69)
!75 = !DILocation(line: 48, column: 27, scope: !69)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !14, line: 49, type: !4)
!77 = !DILocation(line: 49, column: 11, scope: !69)
!78 = !DILocation(line: 49, column: 35, scope: !69)
!79 = !DILocation(line: 49, column: 28, scope: !69)
!80 = !DILocation(line: 50, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !69, file: !14, line: 50, column: 8)
!82 = !DILocation(line: 50, column: 8, scope: !69)
!83 = !DILocation(line: 53, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !14, line: 51, column: 5)
!85 = !DILocation(line: 54, column: 5, scope: !84)
!86 = !DILocation(line: 58, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !14, line: 56, column: 5)
!88 = !DILocation(line: 58, column: 14, scope: !87)
!89 = !DILocalVariable(name: "source", scope: !90, file: !14, line: 61, type: !36)
!90 = distinct !DILexicalBlock(scope: !69, file: !14, line: 60, column: 5)
!91 = !DILocation(line: 61, column: 13, scope: !90)
!92 = !DILocation(line: 63, column: 16, scope: !90)
!93 = !DILocation(line: 63, column: 9, scope: !90)
!94 = !DILocation(line: 64, column: 22, scope: !90)
!95 = !DILocation(line: 64, column: 9, scope: !90)
!96 = !DILocation(line: 66, column: 1, scope: !69)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 69, type: !15, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 71, type: !4)
!99 = !DILocation(line: 71, column: 11, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !14, line: 72, type: !4)
!101 = !DILocation(line: 72, column: 11, scope: !97)
!102 = !DILocation(line: 72, column: 34, scope: !97)
!103 = !DILocation(line: 72, column: 27, scope: !97)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !14, line: 73, type: !4)
!105 = !DILocation(line: 73, column: 11, scope: !97)
!106 = !DILocation(line: 73, column: 35, scope: !97)
!107 = !DILocation(line: 73, column: 28, scope: !97)
!108 = !DILocation(line: 74, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !97, file: !14, line: 74, column: 8)
!110 = !DILocation(line: 74, column: 8, scope: !97)
!111 = !DILocation(line: 77, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !14, line: 75, column: 5)
!113 = !DILocation(line: 77, column: 14, scope: !112)
!114 = !DILocation(line: 78, column: 5, scope: !112)
!115 = !DILocalVariable(name: "source", scope: !116, file: !14, line: 80, type: !36)
!116 = distinct !DILexicalBlock(scope: !97, file: !14, line: 79, column: 5)
!117 = !DILocation(line: 80, column: 13, scope: !116)
!118 = !DILocation(line: 82, column: 16, scope: !116)
!119 = !DILocation(line: 82, column: 9, scope: !116)
!120 = !DILocation(line: 83, column: 22, scope: !116)
!121 = !DILocation(line: 83, column: 9, scope: !116)
!122 = !DILocation(line: 85, column: 1, scope: !97)
