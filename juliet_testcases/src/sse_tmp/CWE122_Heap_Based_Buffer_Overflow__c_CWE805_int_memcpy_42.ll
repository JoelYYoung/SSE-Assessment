; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32*, i32** %data, align 8, !dbg !21
  %call = call i32* @badSource(i32* %0), !dbg !22
  store i32* %call, i32** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !29
  %2 = load i32*, i32** %data, align 8, !dbg !30
  %3 = bitcast i32* %2 to i8*, !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !31
  %4 = bitcast i32* %arraydecay to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !31
  %5 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !32
  %6 = load i32, i32* %arrayidx, align 4, !dbg !32
  call void @printIntLine(i32 %6), !dbg !33
  %7 = load i32*, i32** %data, align 8, !dbg !34
  %8 = bitcast i32* %7 to i8*, !dbg !34
  call void @free(i8* %8) #7, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !42
  %0 = bitcast i8* %call to i32*, !dbg !43
  store i32* %0, i32** %data.addr, align 8, !dbg !44
  %1 = load i32*, i32** %data.addr, align 8, !dbg !45
  %cmp = icmp eq i32* %1, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !51
  ret i32* %2, !dbg !52
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  %0 = load i32*, i32** %data, align 8, !dbg !80
  %call = call i32* @goodG2BSource(i32* %0), !dbg !81
  store i32* %call, i32** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !85
  %2 = load i32*, i32** %data, align 8, !dbg !86
  %3 = bitcast i32* %2 to i8*, !dbg !87
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !87
  %4 = bitcast i32* %arraydecay to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !87
  %5 = load i32*, i32** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !88
  %6 = load i32, i32* %arrayidx, align 4, !dbg !88
  call void @printIntLine(i32 %6), !dbg !89
  %7 = load i32*, i32** %data, align 8, !dbg !90
  %8 = bitcast i32* %7 to i8*, !dbg !90
  call void @free(i8* %8) #7, !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !93 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !96
  %0 = bitcast i8* %call to i32*, !dbg !97
  store i32* %0, i32** %data.addr, align 8, !dbg !98
  %1 = load i32*, i32** %data.addr, align 8, !dbg !99
  %cmp = icmp eq i32* %1, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !105
  ret i32* %2, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !5)
!19 = !DILocation(line: 31, column: 11, scope: !14)
!20 = !DILocation(line: 32, column: 10, scope: !14)
!21 = !DILocation(line: 33, column: 22, scope: !14)
!22 = !DILocation(line: 33, column: 12, scope: !14)
!23 = !DILocation(line: 33, column: 10, scope: !14)
!24 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 35, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 35, column: 13, scope: !25)
!30 = !DILocation(line: 37, column: 16, scope: !25)
!31 = !DILocation(line: 37, column: 9, scope: !25)
!32 = !DILocation(line: 38, column: 22, scope: !25)
!33 = !DILocation(line: 38, column: 9, scope: !25)
!34 = !DILocation(line: 39, column: 14, scope: !25)
!35 = !DILocation(line: 39, column: 9, scope: !25)
!36 = !DILocation(line: 41, column: 1, scope: !14)
!37 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 21, type: !38, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!5, !5}
!40 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !15, line: 21, type: !5)
!41 = !DILocation(line: 21, column: 30, scope: !37)
!42 = !DILocation(line: 24, column: 19, scope: !37)
!43 = !DILocation(line: 24, column: 12, scope: !37)
!44 = !DILocation(line: 24, column: 10, scope: !37)
!45 = !DILocation(line: 25, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !37, file: !15, line: 25, column: 9)
!47 = !DILocation(line: 25, column: 14, scope: !46)
!48 = !DILocation(line: 25, column: 9, scope: !37)
!49 = !DILocation(line: 25, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 25, column: 23)
!51 = !DILocation(line: 26, column: 12, scope: !37)
!52 = !DILocation(line: 26, column: 5, scope: !37)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_42_good", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 72, column: 5, scope: !53)
!55 = !DILocation(line: 73, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 85, type: !57, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!6, !6, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 85, type: !6)
!63 = !DILocation(line: 85, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 85, type: !59)
!65 = !DILocation(line: 85, column: 27, scope: !56)
!66 = !DILocation(line: 88, column: 22, scope: !56)
!67 = !DILocation(line: 88, column: 12, scope: !56)
!68 = !DILocation(line: 88, column: 5, scope: !56)
!69 = !DILocation(line: 90, column: 5, scope: !56)
!70 = !DILocation(line: 91, column: 5, scope: !56)
!71 = !DILocation(line: 92, column: 5, scope: !56)
!72 = !DILocation(line: 95, column: 5, scope: !56)
!73 = !DILocation(line: 96, column: 5, scope: !56)
!74 = !DILocation(line: 97, column: 5, scope: !56)
!75 = !DILocation(line: 99, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 58, type: !5)
!78 = !DILocation(line: 58, column: 11, scope: !76)
!79 = !DILocation(line: 59, column: 10, scope: !76)
!80 = !DILocation(line: 60, column: 26, scope: !76)
!81 = !DILocation(line: 60, column: 12, scope: !76)
!82 = !DILocation(line: 60, column: 10, scope: !76)
!83 = !DILocalVariable(name: "source", scope: !84, file: !15, line: 62, type: !26)
!84 = distinct !DILexicalBlock(scope: !76, file: !15, line: 61, column: 5)
!85 = !DILocation(line: 62, column: 13, scope: !84)
!86 = !DILocation(line: 64, column: 16, scope: !84)
!87 = !DILocation(line: 64, column: 9, scope: !84)
!88 = !DILocation(line: 65, column: 22, scope: !84)
!89 = !DILocation(line: 65, column: 9, scope: !84)
!90 = !DILocation(line: 66, column: 14, scope: !84)
!91 = !DILocation(line: 66, column: 9, scope: !84)
!92 = !DILocation(line: 68, column: 1, scope: !76)
!93 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 47, type: !38, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", arg: 1, scope: !93, file: !15, line: 47, type: !5)
!95 = !DILocation(line: 47, column: 34, scope: !93)
!96 = !DILocation(line: 50, column: 19, scope: !93)
!97 = !DILocation(line: 50, column: 12, scope: !93)
!98 = !DILocation(line: 50, column: 10, scope: !93)
!99 = !DILocation(line: 51, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !15, line: 51, column: 9)
!101 = !DILocation(line: 51, column: 14, scope: !100)
!102 = !DILocation(line: 51, column: 9, scope: !93)
!103 = !DILocation(line: 51, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 51, column: 23)
!105 = !DILocation(line: 52, column: 12, scope: !93)
!106 = !DILocation(line: 52, column: 5, scope: !93)
