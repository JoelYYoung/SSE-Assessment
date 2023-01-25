; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  call void %2(i32* %3), !dbg !35
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !38 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !46
  %1 = load i32*, i32** %data.addr, align 8, !dbg !47
  %2 = bitcast i32* %1 to i8*, !dbg !48
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !48
  %3 = bitcast i32* %arraydecay to i8*, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 40, i1 false), !dbg !48
  %4 = load i32*, i32** %data.addr, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !49
  %5 = load i32, i32* %arrayidx, align 4, !dbg !49
  call void @printIntLine(i32 %5), !dbg !50
  %6 = load i32*, i32** %data.addr, align 8, !dbg !51
  %7 = bitcast i32* %6 to i8*, !dbg !51
  call void @free(i8* %7) #7, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printIntLine(i32) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !80, metadata !DIExpression()), !dbg !81
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !84
  store i32* %0, i32** %data, align 8, !dbg !85
  %1 = load i32*, i32** %data, align 8, !dbg !86
  %cmp = icmp eq i32* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !92
  %3 = load i32*, i32** %data, align 8, !dbg !93
  call void %2(i32* %3), !dbg !92
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !100
  %1 = load i32*, i32** %data.addr, align 8, !dbg !101
  %2 = bitcast i32* %1 to i8*, !dbg !102
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !102
  %3 = bitcast i32* %arraydecay to i8*, !dbg !102
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 40, i1 false), !dbg !102
  %4 = load i32*, i32** %data.addr, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !103
  %5 = load i32, i32* %arrayidx, align 4, !dbg !103
  call void @printIntLine(i32 %5), !dbg !104
  %6 = load i32*, i32** %data.addr, align 8, !dbg !105
  %7 = bitcast i32* %6 to i8*, !dbg !105
  call void @free(i8* %7) #7, !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44_bad", scope: !15, file: !15, line: 32, type: !16, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 34, type: !4)
!19 = !DILocation(line: 34, column: 11, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 36, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 36, column: 12, scope: !14)
!25 = !DILocation(line: 37, column: 10, scope: !14)
!26 = !DILocation(line: 39, column: 19, scope: !14)
!27 = !DILocation(line: 39, column: 12, scope: !14)
!28 = !DILocation(line: 39, column: 10, scope: !14)
!29 = !DILocation(line: 40, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 9)
!31 = !DILocation(line: 40, column: 14, scope: !30)
!32 = !DILocation(line: 40, column: 9, scope: !14)
!33 = !DILocation(line: 40, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 40, column: 23)
!35 = !DILocation(line: 42, column: 5, scope: !14)
!36 = !DILocation(line: 42, column: 13, scope: !14)
!37 = !DILocation(line: 43, column: 1, scope: !14)
!38 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 21, type: !22, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "data", arg: 1, scope: !38, file: !15, line: 21, type: !4)
!40 = !DILocation(line: 21, column: 27, scope: !38)
!41 = !DILocalVariable(name: "source", scope: !42, file: !15, line: 24, type: !43)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 23, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 10)
!46 = !DILocation(line: 24, column: 13, scope: !42)
!47 = !DILocation(line: 26, column: 17, scope: !42)
!48 = !DILocation(line: 26, column: 9, scope: !42)
!49 = !DILocation(line: 27, column: 22, scope: !42)
!50 = !DILocation(line: 27, column: 9, scope: !42)
!51 = !DILocation(line: 28, column: 14, scope: !42)
!52 = !DILocation(line: 28, column: 9, scope: !42)
!53 = !DILocation(line: 30, column: 1, scope: !38)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_44_good", scope: !15, file: !15, line: 72, type: !16, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 74, column: 5, scope: !54)
!56 = !DILocation(line: 75, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 86, type: !58, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!5, !5, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !15, line: 86, type: !5)
!64 = !DILocation(line: 86, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !15, line: 86, type: !60)
!66 = !DILocation(line: 86, column: 27, scope: !57)
!67 = !DILocation(line: 89, column: 22, scope: !57)
!68 = !DILocation(line: 89, column: 12, scope: !57)
!69 = !DILocation(line: 89, column: 5, scope: !57)
!70 = !DILocation(line: 91, column: 5, scope: !57)
!71 = !DILocation(line: 92, column: 5, scope: !57)
!72 = !DILocation(line: 93, column: 5, scope: !57)
!73 = !DILocation(line: 96, column: 5, scope: !57)
!74 = !DILocation(line: 97, column: 5, scope: !57)
!75 = !DILocation(line: 98, column: 5, scope: !57)
!76 = !DILocation(line: 100, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 63, type: !4)
!79 = !DILocation(line: 63, column: 11, scope: !77)
!80 = !DILocalVariable(name: "funcPtr", scope: !77, file: !15, line: 64, type: !21)
!81 = !DILocation(line: 64, column: 12, scope: !77)
!82 = !DILocation(line: 65, column: 10, scope: !77)
!83 = !DILocation(line: 67, column: 19, scope: !77)
!84 = !DILocation(line: 67, column: 12, scope: !77)
!85 = !DILocation(line: 67, column: 10, scope: !77)
!86 = !DILocation(line: 68, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !15, line: 68, column: 9)
!88 = !DILocation(line: 68, column: 14, scope: !87)
!89 = !DILocation(line: 68, column: 9, scope: !77)
!90 = !DILocation(line: 68, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 68, column: 23)
!92 = !DILocation(line: 69, column: 5, scope: !77)
!93 = !DILocation(line: 69, column: 13, scope: !77)
!94 = !DILocation(line: 70, column: 1, scope: !77)
!95 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 50, type: !22, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !15, line: 50, type: !4)
!97 = !DILocation(line: 50, column: 31, scope: !95)
!98 = !DILocalVariable(name: "source", scope: !99, file: !15, line: 53, type: !43)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 52, column: 5)
!100 = !DILocation(line: 53, column: 13, scope: !99)
!101 = !DILocation(line: 55, column: 17, scope: !99)
!102 = !DILocation(line: 55, column: 9, scope: !99)
!103 = !DILocation(line: 56, column: 22, scope: !99)
!104 = !DILocation(line: 56, column: 9, scope: !99)
!105 = !DILocation(line: 57, column: 14, scope: !99)
!106 = !DILocation(line: 57, column: 9, scope: !99)
!107 = !DILocation(line: 59, column: 1, scope: !95)
