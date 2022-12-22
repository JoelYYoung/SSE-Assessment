; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %2, i32** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !38
  store i32* %3, i32** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad.source to i8*), i64 44, i1 false), !dbg !44
  %5 = load i32*, i32** %data1, align 8, !dbg !45
  %6 = bitcast i32* %5 to i8*, !dbg !46
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %7 = bitcast i32* %arraydecay to i8*, !dbg !46
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !47
  %call3 = call i64 @wcslen(i32* %arraydecay2) #9, !dbg !48
  %add = add i64 %call3, 1, !dbg !49
  %mul = mul i64 %add, 4, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 %mul, i1 false), !dbg !46
  %8 = load i32*, i32** %data1, align 8, !dbg !51
  call void @printWLine(i32* %8), !dbg !52
  %9 = load i32*, i32** %data1, align 8, !dbg !53
  %10 = bitcast i32* %9 to i8*, !dbg !53
  call void @free(i8* %10) #7, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #7, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #7, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !84
  store i32* %0, i32** %data, align 8, !dbg !85
  %1 = load i32*, i32** %data, align 8, !dbg !86
  %cmp = icmp eq i32* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = load i32*, i32** %data, align 8, !dbg !95
  store i32* %2, i32** %dataCopy, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !96, metadata !DIExpression()), !dbg !97
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !98
  store i32* %3, i32** %data1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !101
  %5 = load i32*, i32** %data1, align 8, !dbg !102
  %6 = bitcast i32* %5 to i8*, !dbg !103
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %7 = bitcast i32* %arraydecay to i8*, !dbg !103
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !104
  %call3 = call i64 @wcslen(i32* %arraydecay2) #9, !dbg !105
  %add = add i64 %call3, 1, !dbg !106
  %mul = mul i64 %add, 4, !dbg !107
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 %mul, i1 false), !dbg !103
  %8 = load i32*, i32** %data1, align 8, !dbg !108
  call void @printWLine(i32* %8), !dbg !109
  %9 = load i32*, i32** %data1, align 8, !dbg !110
  %10 = bitcast i32* %9 to i8*, !dbg !110
  call void @free(i8* %10) #7, !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 33, column: 23, scope: !16)
!24 = !DILocation(line: 33, column: 12, scope: !16)
!25 = !DILocation(line: 33, column: 10, scope: !16)
!26 = !DILocation(line: 34, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 9)
!28 = !DILocation(line: 34, column: 14, scope: !27)
!29 = !DILocation(line: 34, column: 9, scope: !16)
!30 = !DILocation(line: 34, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 34, column: 23)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !17, line: 36, type: !4)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!34 = !DILocation(line: 36, column: 19, scope: !33)
!35 = !DILocation(line: 36, column: 30, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !17, line: 37, type: !4)
!37 = !DILocation(line: 37, column: 19, scope: !33)
!38 = !DILocation(line: 37, column: 26, scope: !33)
!39 = !DILocalVariable(name: "source", scope: !40, file: !17, line: 39, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !17, line: 38, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 39, column: 21, scope: !40)
!45 = !DILocation(line: 42, column: 21, scope: !40)
!46 = !DILocation(line: 42, column: 13, scope: !40)
!47 = !DILocation(line: 42, column: 43, scope: !40)
!48 = !DILocation(line: 42, column: 36, scope: !40)
!49 = !DILocation(line: 42, column: 51, scope: !40)
!50 = !DILocation(line: 42, column: 56, scope: !40)
!51 = !DILocation(line: 43, column: 24, scope: !40)
!52 = !DILocation(line: 43, column: 13, scope: !40)
!53 = !DILocation(line: 44, column: 18, scope: !40)
!54 = !DILocation(line: 44, column: 13, scope: !40)
!55 = !DILocation(line: 47, column: 1, scope: !16)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_good", scope: !17, file: !17, line: 75, type: !18, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 77, column: 5, scope: !56)
!58 = !DILocation(line: 78, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 89, type: !60, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !17, line: 89, type: !7)
!66 = !DILocation(line: 89, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !17, line: 89, type: !62)
!68 = !DILocation(line: 89, column: 27, scope: !59)
!69 = !DILocation(line: 92, column: 22, scope: !59)
!70 = !DILocation(line: 92, column: 12, scope: !59)
!71 = !DILocation(line: 92, column: 5, scope: !59)
!72 = !DILocation(line: 94, column: 5, scope: !59)
!73 = !DILocation(line: 95, column: 5, scope: !59)
!74 = !DILocation(line: 96, column: 5, scope: !59)
!75 = !DILocation(line: 99, column: 5, scope: !59)
!76 = !DILocation(line: 100, column: 5, scope: !59)
!77 = !DILocation(line: 101, column: 5, scope: !59)
!78 = !DILocation(line: 103, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !17, line: 56, type: !4)
!81 = !DILocation(line: 56, column: 15, scope: !79)
!82 = !DILocation(line: 57, column: 10, scope: !79)
!83 = !DILocation(line: 59, column: 23, scope: !79)
!84 = !DILocation(line: 59, column: 12, scope: !79)
!85 = !DILocation(line: 59, column: 10, scope: !79)
!86 = !DILocation(line: 60, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !17, line: 60, column: 9)
!88 = !DILocation(line: 60, column: 14, scope: !87)
!89 = !DILocation(line: 60, column: 9, scope: !79)
!90 = !DILocation(line: 60, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !17, line: 60, column: 23)
!92 = !DILocalVariable(name: "dataCopy", scope: !93, file: !17, line: 62, type: !4)
!93 = distinct !DILexicalBlock(scope: !79, file: !17, line: 61, column: 5)
!94 = !DILocation(line: 62, column: 19, scope: !93)
!95 = !DILocation(line: 62, column: 30, scope: !93)
!96 = !DILocalVariable(name: "data", scope: !93, file: !17, line: 63, type: !4)
!97 = !DILocation(line: 63, column: 19, scope: !93)
!98 = !DILocation(line: 63, column: 26, scope: !93)
!99 = !DILocalVariable(name: "source", scope: !100, file: !17, line: 65, type: !41)
!100 = distinct !DILexicalBlock(scope: !93, file: !17, line: 64, column: 9)
!101 = !DILocation(line: 65, column: 21, scope: !100)
!102 = !DILocation(line: 68, column: 21, scope: !100)
!103 = !DILocation(line: 68, column: 13, scope: !100)
!104 = !DILocation(line: 68, column: 43, scope: !100)
!105 = !DILocation(line: 68, column: 36, scope: !100)
!106 = !DILocation(line: 68, column: 51, scope: !100)
!107 = !DILocation(line: 68, column: 56, scope: !100)
!108 = !DILocation(line: 69, column: 24, scope: !100)
!109 = !DILocation(line: 69, column: 13, scope: !100)
!110 = !DILocation(line: 70, column: 18, scope: !100)
!111 = !DILocation(line: 70, column: 13, scope: !100)
!112 = !DILocation(line: 73, column: 1, scope: !79)
