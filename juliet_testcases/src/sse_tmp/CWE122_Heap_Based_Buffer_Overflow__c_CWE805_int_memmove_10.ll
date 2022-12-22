; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !24
  %1 = bitcast i8* %call to i32*, !dbg !26
  store i32* %1, i32** %data, align 8, !dbg !27
  %2 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %2, null, !dbg !30
  br i1 %cmp, label %if.then1, label %if.end, !dbg !31

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !34

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %5 = bitcast i32* %4 to i8*, !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %6 = bitcast i32* %arraydecay to i8*, !dbg !42
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !43
  %8 = load i32, i32* %arrayidx, align 4, !dbg !43
  call void @printIntLine(i32 %8), !dbg !44
  %9 = load i32*, i32** %data, align 8, !dbg !45
  %10 = bitcast i32* %9 to i8*, !dbg !45
  call void @free(i8* %10) #7, !dbg !46
  ret void, !dbg !47
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32* null, i32** %data, align 8, !dbg !75
  %0 = load i32, i32* @globalFalse, align 4, !dbg !76
  %tobool = icmp ne i32 %0, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  br label %if.end2, !dbg !81

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !82
  %1 = bitcast i8* %call to i32*, !dbg !84
  store i32* %1, i32** %data, align 8, !dbg !85
  %2 = load i32*, i32** %data, align 8, !dbg !86
  %cmp = icmp eq i32* %2, null, !dbg !88
  br i1 %cmp, label %if.then1, label %if.end, !dbg !89

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !94
  %4 = load i32*, i32** %data, align 8, !dbg !95
  %5 = bitcast i32* %4 to i8*, !dbg !96
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !96
  %6 = bitcast i32* %arraydecay to i8*, !dbg !96
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !96
  %7 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !97
  %8 = load i32, i32* %arrayidx, align 4, !dbg !97
  call void @printIntLine(i32 %8), !dbg !98
  %9 = load i32*, i32** %data, align 8, !dbg !99
  %10 = bitcast i32* %9 to i8*, !dbg !99
  call void @free(i8* %10) #7, !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i32* null, i32** %data, align 8, !dbg !105
  %0 = load i32, i32* @globalTrue, align 4, !dbg !106
  %tobool = icmp ne i32 %0, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.end2, !dbg !108

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !109
  %1 = bitcast i8* %call to i32*, !dbg !111
  store i32* %1, i32** %data, align 8, !dbg !112
  %2 = load i32*, i32** %data, align 8, !dbg !113
  %cmp = icmp eq i32* %2, null, !dbg !115
  br i1 %cmp, label %if.then1, label %if.end, !dbg !116

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !119

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !122
  %4 = load i32*, i32** %data, align 8, !dbg !123
  %5 = bitcast i32* %4 to i8*, !dbg !124
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !124
  %6 = bitcast i32* %arraydecay to i8*, !dbg !124
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !124
  %7 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !125
  %8 = load i32, i32* %arrayidx, align 4, !dbg !125
  call void @printIntLine(i32 %8), !dbg !126
  %9 = load i32*, i32** %data, align 8, !dbg !127
  %10 = bitcast i32* %9 to i8*, !dbg !127
  call void @free(i8* %10) #7, !dbg !128
  ret void, !dbg !129
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 25, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 8)
!23 = !DILocation(line: 25, column: 8, scope: !14)
!24 = !DILocation(line: 28, column: 23, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 26, column: 5)
!26 = !DILocation(line: 28, column: 16, scope: !25)
!27 = !DILocation(line: 28, column: 14, scope: !25)
!28 = !DILocation(line: 29, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 29, column: 13)
!30 = !DILocation(line: 29, column: 18, scope: !29)
!31 = !DILocation(line: 29, column: 13, scope: !25)
!32 = !DILocation(line: 29, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 27)
!34 = !DILocation(line: 30, column: 5, scope: !25)
!35 = !DILocalVariable(name: "source", scope: !36, file: !15, line: 32, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 32, column: 13, scope: !36)
!41 = !DILocation(line: 34, column: 17, scope: !36)
!42 = !DILocation(line: 34, column: 9, scope: !36)
!43 = !DILocation(line: 35, column: 22, scope: !36)
!44 = !DILocation(line: 35, column: 9, scope: !36)
!45 = !DILocation(line: 36, column: 14, scope: !36)
!46 = !DILocation(line: 36, column: 9, scope: !36)
!47 = !DILocation(line: 38, column: 1, scope: !14)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_10_good", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 91, column: 5, scope: !48)
!50 = !DILocation(line: 92, column: 5, scope: !48)
!51 = !DILocation(line: 93, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !53, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!5, !5, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 105, type: !5)
!59 = !DILocation(line: 105, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 105, type: !55)
!61 = !DILocation(line: 105, column: 27, scope: !52)
!62 = !DILocation(line: 108, column: 22, scope: !52)
!63 = !DILocation(line: 108, column: 12, scope: !52)
!64 = !DILocation(line: 108, column: 5, scope: !52)
!65 = !DILocation(line: 110, column: 5, scope: !52)
!66 = !DILocation(line: 111, column: 5, scope: !52)
!67 = !DILocation(line: 112, column: 5, scope: !52)
!68 = !DILocation(line: 115, column: 5, scope: !52)
!69 = !DILocation(line: 116, column: 5, scope: !52)
!70 = !DILocation(line: 117, column: 5, scope: !52)
!71 = !DILocation(line: 119, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !15, line: 47, type: !4)
!74 = !DILocation(line: 47, column: 11, scope: !72)
!75 = !DILocation(line: 48, column: 10, scope: !72)
!76 = !DILocation(line: 49, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !15, line: 49, column: 8)
!78 = !DILocation(line: 49, column: 8, scope: !72)
!79 = !DILocation(line: 52, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !15, line: 50, column: 5)
!81 = !DILocation(line: 53, column: 5, scope: !80)
!82 = !DILocation(line: 57, column: 23, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !15, line: 55, column: 5)
!84 = !DILocation(line: 57, column: 16, scope: !83)
!85 = !DILocation(line: 57, column: 14, scope: !83)
!86 = !DILocation(line: 58, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 58, column: 13)
!88 = !DILocation(line: 58, column: 18, scope: !87)
!89 = !DILocation(line: 58, column: 13, scope: !83)
!90 = !DILocation(line: 58, column: 28, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 58, column: 27)
!92 = !DILocalVariable(name: "source", scope: !93, file: !15, line: 61, type: !37)
!93 = distinct !DILexicalBlock(scope: !72, file: !15, line: 60, column: 5)
!94 = !DILocation(line: 61, column: 13, scope: !93)
!95 = !DILocation(line: 63, column: 17, scope: !93)
!96 = !DILocation(line: 63, column: 9, scope: !93)
!97 = !DILocation(line: 64, column: 22, scope: !93)
!98 = !DILocation(line: 64, column: 9, scope: !93)
!99 = !DILocation(line: 65, column: 14, scope: !93)
!100 = !DILocation(line: 65, column: 9, scope: !93)
!101 = !DILocation(line: 67, column: 1, scope: !72)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !15, line: 72, type: !4)
!104 = !DILocation(line: 72, column: 11, scope: !102)
!105 = !DILocation(line: 73, column: 10, scope: !102)
!106 = !DILocation(line: 74, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !15, line: 74, column: 8)
!108 = !DILocation(line: 74, column: 8, scope: !102)
!109 = !DILocation(line: 77, column: 23, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !15, line: 75, column: 5)
!111 = !DILocation(line: 77, column: 16, scope: !110)
!112 = !DILocation(line: 77, column: 14, scope: !110)
!113 = !DILocation(line: 78, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 78, column: 13)
!115 = !DILocation(line: 78, column: 18, scope: !114)
!116 = !DILocation(line: 78, column: 13, scope: !110)
!117 = !DILocation(line: 78, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 78, column: 27)
!119 = !DILocation(line: 79, column: 5, scope: !110)
!120 = !DILocalVariable(name: "source", scope: !121, file: !15, line: 81, type: !37)
!121 = distinct !DILexicalBlock(scope: !102, file: !15, line: 80, column: 5)
!122 = !DILocation(line: 81, column: 13, scope: !121)
!123 = !DILocation(line: 83, column: 17, scope: !121)
!124 = !DILocation(line: 83, column: 9, scope: !121)
!125 = !DILocation(line: 84, column: 22, scope: !121)
!126 = !DILocation(line: 84, column: 9, scope: !121)
!127 = !DILocation(line: 85, column: 14, scope: !121)
!128 = !DILocation(line: 85, column: 9, scope: !121)
!129 = !DILocation(line: 87, column: 1, scope: !102)
