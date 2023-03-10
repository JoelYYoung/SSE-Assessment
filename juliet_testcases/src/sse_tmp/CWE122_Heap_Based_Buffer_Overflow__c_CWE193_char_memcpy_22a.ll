; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_badGlobal, align 4, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_badSource(i8* %0), !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !39
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !40
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !41
  %add = add i64 %call2, 1, !dbg !42
  %mul = mul i64 %add, 1, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %3), !dbg !45
  %4 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* %4) #7, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i8* null, i8** %data, align 8, !dbg !74
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B1Global, align 4, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B1Source(i8* %0), !dbg !77
  store i8* %call, i8** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !79, metadata !DIExpression()), !dbg !81
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !81
  %2 = load i8*, i8** %data, align 8, !dbg !82
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !83
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !84
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !85
  %add = add i64 %call2, 1, !dbg !86
  %mul = mul i64 %add, 1, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* %3), !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  call void @free(i8* %4) #7, !dbg !91
  ret void, !dbg !92
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i8* null, i8** %data, align 8, !dbg !96
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B2Global, align 4, !dbg !97
  %0 = load i8*, i8** %data, align 8, !dbg !98
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B2Source(i8* %0), !dbg !99
  store i8* %call, i8** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !105
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !106
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !107
  %add = add i64 %call2, 1, !dbg !108
  %mul = mul i64 %add, 1, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !105
  %3 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* %3), !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* %4) #7, !dbg !113
  ret void, !dbg !114
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_badGlobal", scope: !2, file: !10, line: 29, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B1Global", scope: !2, file: !10, line: 54, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_goodG2B2Global", scope: !2, file: !10, line: 55, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_bad", scope: !10, file: !10, line: 33, type: !21, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 35, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 35, column: 12, scope: !20)
!27 = !DILocation(line: 36, column: 10, scope: !20)
!28 = !DILocation(line: 37, column: 74, scope: !20)
!29 = !DILocation(line: 38, column: 81, scope: !20)
!30 = !DILocation(line: 38, column: 12, scope: !20)
!31 = !DILocation(line: 38, column: 10, scope: !20)
!32 = !DILocalVariable(name: "source", scope: !33, file: !10, line: 40, type: !34)
!33 = distinct !DILexicalBlock(scope: !20, file: !10, line: 39, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 88, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 40, column: 14, scope: !33)
!38 = !DILocation(line: 43, column: 16, scope: !33)
!39 = !DILocation(line: 43, column: 9, scope: !33)
!40 = !DILocation(line: 43, column: 38, scope: !33)
!41 = !DILocation(line: 43, column: 31, scope: !33)
!42 = !DILocation(line: 43, column: 46, scope: !33)
!43 = !DILocation(line: 43, column: 51, scope: !33)
!44 = !DILocation(line: 44, column: 19, scope: !33)
!45 = !DILocation(line: 44, column: 9, scope: !33)
!46 = !DILocation(line: 45, column: 14, scope: !33)
!47 = !DILocation(line: 45, column: 9, scope: !33)
!48 = !DILocation(line: 47, column: 1, scope: !20)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_22_good", scope: !10, file: !10, line: 95, type: !21, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DILocation(line: 97, column: 5, scope: !49)
!51 = !DILocation(line: 98, column: 5, scope: !49)
!52 = !DILocation(line: 99, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 111, type: !54, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!11, !11, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !10, line: 111, type: !11)
!58 = !DILocation(line: 111, column: 14, scope: !53)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !10, line: 111, type: !56)
!60 = !DILocation(line: 111, column: 27, scope: !53)
!61 = !DILocation(line: 114, column: 22, scope: !53)
!62 = !DILocation(line: 114, column: 12, scope: !53)
!63 = !DILocation(line: 114, column: 5, scope: !53)
!64 = !DILocation(line: 116, column: 5, scope: !53)
!65 = !DILocation(line: 117, column: 5, scope: !53)
!66 = !DILocation(line: 118, column: 5, scope: !53)
!67 = !DILocation(line: 121, column: 5, scope: !53)
!68 = !DILocation(line: 122, column: 5, scope: !53)
!69 = !DILocation(line: 123, column: 5, scope: !53)
!70 = !DILocation(line: 125, column: 5, scope: !53)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocalVariable(name: "data", scope: !71, file: !10, line: 62, type: !24)
!73 = !DILocation(line: 62, column: 12, scope: !71)
!74 = !DILocation(line: 63, column: 10, scope: !71)
!75 = !DILocation(line: 64, column: 79, scope: !71)
!76 = !DILocation(line: 65, column: 86, scope: !71)
!77 = !DILocation(line: 65, column: 12, scope: !71)
!78 = !DILocation(line: 65, column: 10, scope: !71)
!79 = !DILocalVariable(name: "source", scope: !80, file: !10, line: 67, type: !34)
!80 = distinct !DILexicalBlock(scope: !71, file: !10, line: 66, column: 5)
!81 = !DILocation(line: 67, column: 14, scope: !80)
!82 = !DILocation(line: 70, column: 16, scope: !80)
!83 = !DILocation(line: 70, column: 9, scope: !80)
!84 = !DILocation(line: 70, column: 38, scope: !80)
!85 = !DILocation(line: 70, column: 31, scope: !80)
!86 = !DILocation(line: 70, column: 46, scope: !80)
!87 = !DILocation(line: 70, column: 51, scope: !80)
!88 = !DILocation(line: 71, column: 19, scope: !80)
!89 = !DILocation(line: 71, column: 9, scope: !80)
!90 = !DILocation(line: 72, column: 14, scope: !80)
!91 = !DILocation(line: 72, column: 9, scope: !80)
!92 = !DILocation(line: 74, column: 1, scope: !71)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 79, type: !21, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocalVariable(name: "data", scope: !93, file: !10, line: 81, type: !24)
!95 = !DILocation(line: 81, column: 12, scope: !93)
!96 = !DILocation(line: 82, column: 10, scope: !93)
!97 = !DILocation(line: 83, column: 79, scope: !93)
!98 = !DILocation(line: 84, column: 86, scope: !93)
!99 = !DILocation(line: 84, column: 12, scope: !93)
!100 = !DILocation(line: 84, column: 10, scope: !93)
!101 = !DILocalVariable(name: "source", scope: !102, file: !10, line: 86, type: !34)
!102 = distinct !DILexicalBlock(scope: !93, file: !10, line: 85, column: 5)
!103 = !DILocation(line: 86, column: 14, scope: !102)
!104 = !DILocation(line: 89, column: 16, scope: !102)
!105 = !DILocation(line: 89, column: 9, scope: !102)
!106 = !DILocation(line: 89, column: 38, scope: !102)
!107 = !DILocation(line: 89, column: 31, scope: !102)
!108 = !DILocation(line: 89, column: 46, scope: !102)
!109 = !DILocation(line: 89, column: 51, scope: !102)
!110 = !DILocation(line: 90, column: 19, scope: !102)
!111 = !DILocation(line: 90, column: 9, scope: !102)
!112 = !DILocation(line: 91, column: 14, scope: !102)
!113 = !DILocation(line: 91, column: 9, scope: !102)
!114 = !DILocation(line: 93, column: 1, scope: !93)
