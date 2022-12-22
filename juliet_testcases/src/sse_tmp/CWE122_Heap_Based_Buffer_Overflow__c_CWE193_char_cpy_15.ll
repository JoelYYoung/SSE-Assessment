; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  call void @printLine(i8* %3), !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  call void @free(i8* %4) #6, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #6, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #6, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i8* null, i8** %data, align 8, !dbg !69
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !70
  store i8* %call, i8** %data, align 8, !dbg !71
  %0 = load i8*, i8** %data, align 8, !dbg !72
  %cmp = icmp eq i8* %0, null, !dbg !74
  br i1 %cmp, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !78, metadata !DIExpression()), !dbg !80
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !80
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !80
  %2 = load i8*, i8** %data, align 8, !dbg !81
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !82
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !84
  call void @printLine(i8* %3), !dbg !85
  %4 = load i8*, i8** %data, align 8, !dbg !86
  call void @free(i8* %4) #6, !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i8* null, i8** %data, align 8, !dbg !92
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !93
  store i8* %call, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %cmp = icmp eq i8* %0, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !105
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %3), !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !109
  call void @free(i8* %4) #6, !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 36, column: 24, scope: !14)
!22 = !DILocation(line: 36, column: 14, scope: !14)
!23 = !DILocation(line: 37, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 13)
!25 = !DILocation(line: 37, column: 18, scope: !24)
!26 = !DILocation(line: 37, column: 13, scope: !14)
!27 = !DILocation(line: 37, column: 28, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 37, column: 27)
!29 = !DILocalVariable(name: "source", scope: !30, file: !15, line: 45, type: !31)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 45, column: 14, scope: !30)
!35 = !DILocation(line: 47, column: 16, scope: !30)
!36 = !DILocation(line: 47, column: 22, scope: !30)
!37 = !DILocation(line: 47, column: 9, scope: !30)
!38 = !DILocation(line: 48, column: 19, scope: !30)
!39 = !DILocation(line: 48, column: 9, scope: !30)
!40 = !DILocation(line: 49, column: 14, scope: !30)
!41 = !DILocation(line: 49, column: 9, scope: !30)
!42 = !DILocation(line: 51, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_15_good", scope: !15, file: !15, line: 109, type: !16, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 111, column: 5, scope: !43)
!45 = !DILocation(line: 112, column: 5, scope: !43)
!46 = !DILocation(line: 113, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 125, type: !48, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 125, type: !50)
!53 = !DILocation(line: 125, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 125, type: !51)
!55 = !DILocation(line: 125, column: 27, scope: !47)
!56 = !DILocation(line: 128, column: 22, scope: !47)
!57 = !DILocation(line: 128, column: 12, scope: !47)
!58 = !DILocation(line: 128, column: 5, scope: !47)
!59 = !DILocation(line: 130, column: 5, scope: !47)
!60 = !DILocation(line: 131, column: 5, scope: !47)
!61 = !DILocation(line: 132, column: 5, scope: !47)
!62 = !DILocation(line: 135, column: 5, scope: !47)
!63 = !DILocation(line: 136, column: 5, scope: !47)
!64 = !DILocation(line: 137, column: 5, scope: !47)
!65 = !DILocation(line: 139, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 60, type: !4)
!68 = !DILocation(line: 60, column: 12, scope: !66)
!69 = !DILocation(line: 61, column: 10, scope: !66)
!70 = !DILocation(line: 70, column: 24, scope: !66)
!71 = !DILocation(line: 70, column: 14, scope: !66)
!72 = !DILocation(line: 71, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !66, file: !15, line: 71, column: 13)
!74 = !DILocation(line: 71, column: 18, scope: !73)
!75 = !DILocation(line: 71, column: 13, scope: !66)
!76 = !DILocation(line: 71, column: 28, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 71, column: 27)
!78 = !DILocalVariable(name: "source", scope: !79, file: !15, line: 75, type: !31)
!79 = distinct !DILexicalBlock(scope: !66, file: !15, line: 74, column: 5)
!80 = !DILocation(line: 75, column: 14, scope: !79)
!81 = !DILocation(line: 77, column: 16, scope: !79)
!82 = !DILocation(line: 77, column: 22, scope: !79)
!83 = !DILocation(line: 77, column: 9, scope: !79)
!84 = !DILocation(line: 78, column: 19, scope: !79)
!85 = !DILocation(line: 78, column: 9, scope: !79)
!86 = !DILocation(line: 79, column: 14, scope: !79)
!87 = !DILocation(line: 79, column: 9, scope: !79)
!88 = !DILocation(line: 81, column: 1, scope: !66)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !15, line: 86, type: !4)
!91 = !DILocation(line: 86, column: 12, scope: !89)
!92 = !DILocation(line: 87, column: 10, scope: !89)
!93 = !DILocation(line: 92, column: 24, scope: !89)
!94 = !DILocation(line: 92, column: 14, scope: !89)
!95 = !DILocation(line: 93, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !15, line: 93, column: 13)
!97 = !DILocation(line: 93, column: 18, scope: !96)
!98 = !DILocation(line: 93, column: 13, scope: !89)
!99 = !DILocation(line: 93, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 93, column: 27)
!101 = !DILocalVariable(name: "source", scope: !102, file: !15, line: 101, type: !31)
!102 = distinct !DILexicalBlock(scope: !89, file: !15, line: 100, column: 5)
!103 = !DILocation(line: 101, column: 14, scope: !102)
!104 = !DILocation(line: 103, column: 16, scope: !102)
!105 = !DILocation(line: 103, column: 22, scope: !102)
!106 = !DILocation(line: 103, column: 9, scope: !102)
!107 = !DILocation(line: 104, column: 19, scope: !102)
!108 = !DILocation(line: 104, column: 9, scope: !102)
!109 = !DILocation(line: 105, column: 14, scope: !102)
!110 = !DILocation(line: 105, column: 9, scope: !102)
!111 = !DILocation(line: 107, column: 1, scope: !89)
