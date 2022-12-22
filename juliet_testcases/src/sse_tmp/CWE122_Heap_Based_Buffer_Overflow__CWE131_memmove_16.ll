; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !32

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %4 = bitcast i32* %3 to i8*, !dbg !40
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !40
  %5 = bitcast i32* %arraydecay to i8*, !dbg !40
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !41
  %7 = load i32, i32* %arrayidx, align 4, !dbg !41
  call void @printIntLine(i32 %7), !dbg !42
  %8 = load i32*, i32** %data, align 8, !dbg !43
  %9 = bitcast i32* %8 to i8*, !dbg !43
  call void @free(i8* %9) #7, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
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
  %call = call i64 @time(i64* null) #7, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #7, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32* null, i32** %data, align 8, !dbg !72
  br label %while.body, !dbg !73

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !74
  %0 = bitcast i8* %call to i32*, !dbg !76
  store i32* %0, i32** %data, align 8, !dbg !77
  %1 = load i32*, i32** %data, align 8, !dbg !78
  %cmp = icmp eq i32* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !84

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !87
  %3 = load i32*, i32** %data, align 8, !dbg !88
  %4 = bitcast i32* %3 to i8*, !dbg !89
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !89
  %5 = bitcast i32* %arraydecay to i8*, !dbg !89
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !89
  %6 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !90
  %7 = load i32, i32* %arrayidx, align 4, !dbg !90
  call void @printIntLine(i32 %7), !dbg !91
  %8 = load i32*, i32** %data, align 8, !dbg !92
  %9 = bitcast i32* %8 to i8*, !dbg !92
  call void @free(i8* %9) #7, !dbg !93
  ret void, !dbg !94
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 25, column: 5, scope: !14)
!22 = !DILocation(line: 28, column: 23, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 26, column: 5)
!24 = !DILocation(line: 28, column: 16, scope: !23)
!25 = !DILocation(line: 28, column: 14, scope: !23)
!26 = !DILocation(line: 29, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 29, column: 13)
!28 = !DILocation(line: 29, column: 18, scope: !27)
!29 = !DILocation(line: 29, column: 13, scope: !23)
!30 = !DILocation(line: 29, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 29, column: 27)
!32 = !DILocation(line: 30, column: 9, scope: !23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 33, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 10)
!38 = !DILocation(line: 33, column: 13, scope: !34)
!39 = !DILocation(line: 35, column: 17, scope: !34)
!40 = !DILocation(line: 35, column: 9, scope: !34)
!41 = !DILocation(line: 36, column: 22, scope: !34)
!42 = !DILocation(line: 36, column: 9, scope: !34)
!43 = !DILocation(line: 37, column: 14, scope: !34)
!44 = !DILocation(line: 37, column: 9, scope: !34)
!45 = !DILocation(line: 39, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_16_good", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 68, column: 5, scope: !46)
!48 = !DILocation(line: 69, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 81, type: !50, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!5, !5, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !15, line: 81, type: !5)
!56 = !DILocation(line: 81, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !15, line: 81, type: !52)
!58 = !DILocation(line: 81, column: 27, scope: !49)
!59 = !DILocation(line: 84, column: 22, scope: !49)
!60 = !DILocation(line: 84, column: 12, scope: !49)
!61 = !DILocation(line: 84, column: 5, scope: !49)
!62 = !DILocation(line: 86, column: 5, scope: !49)
!63 = !DILocation(line: 87, column: 5, scope: !49)
!64 = !DILocation(line: 88, column: 5, scope: !49)
!65 = !DILocation(line: 91, column: 5, scope: !49)
!66 = !DILocation(line: 92, column: 5, scope: !49)
!67 = !DILocation(line: 93, column: 5, scope: !49)
!68 = !DILocation(line: 95, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 46, type: !16, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 48, type: !4)
!71 = !DILocation(line: 48, column: 11, scope: !69)
!72 = !DILocation(line: 49, column: 10, scope: !69)
!73 = !DILocation(line: 50, column: 5, scope: !69)
!74 = !DILocation(line: 53, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !15, line: 51, column: 5)
!76 = !DILocation(line: 53, column: 16, scope: !75)
!77 = !DILocation(line: 53, column: 14, scope: !75)
!78 = !DILocation(line: 54, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 54, column: 13)
!80 = !DILocation(line: 54, column: 18, scope: !79)
!81 = !DILocation(line: 54, column: 13, scope: !75)
!82 = !DILocation(line: 54, column: 28, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 54, column: 27)
!84 = !DILocation(line: 55, column: 9, scope: !75)
!85 = !DILocalVariable(name: "source", scope: !86, file: !15, line: 58, type: !35)
!86 = distinct !DILexicalBlock(scope: !69, file: !15, line: 57, column: 5)
!87 = !DILocation(line: 58, column: 13, scope: !86)
!88 = !DILocation(line: 60, column: 17, scope: !86)
!89 = !DILocation(line: 60, column: 9, scope: !86)
!90 = !DILocation(line: 61, column: 22, scope: !86)
!91 = !DILocation(line: 61, column: 9, scope: !86)
!92 = !DILocation(line: 62, column: 14, scope: !86)
!93 = !DILocation(line: 62, column: 9, scope: !86)
!94 = !DILocation(line: 64, column: 1, scope: !69)
