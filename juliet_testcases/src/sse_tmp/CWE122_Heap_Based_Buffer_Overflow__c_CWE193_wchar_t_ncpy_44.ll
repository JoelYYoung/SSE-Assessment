; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  call void %2(i32* %3), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !48
  %1 = load i32*, i32** %data.addr, align 8, !dbg !49
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !52
  %add = add i64 %call, 1, !dbg !53
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay, i64 %add) #7, !dbg !54
  %2 = load i32*, i32** %data.addr, align 8, !dbg !55
  call void @printWLine(i32* %2), !dbg !56
  %3 = load i32*, i32** %data.addr, align 8, !dbg !57
  %4 = bitcast i32* %3 to i8*, !dbg !57
  call void @free(i8* %4) #7, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #7, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #7, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !86, metadata !DIExpression()), !dbg !87
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !98
  %3 = load i32*, i32** %data, align 8, !dbg !99
  call void %2(i32* %3), !dbg !98
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !101 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !106
  %1 = load i32*, i32** %data.addr, align 8, !dbg !107
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !108
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !109
  %call = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !110
  %add = add i64 %call, 1, !dbg !111
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay, i64 %add) #7, !dbg !112
  %2 = load i32*, i32** %data.addr, align 8, !dbg !113
  call void @printWLine(i32* %2), !dbg !114
  %3 = load i32*, i32** %data.addr, align 8, !dbg !115
  %4 = bitcast i32* %3 to i8*, !dbg !115
  call void @free(i8* %4) #7, !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44_bad", scope: !17, file: !17, line: 40, type: !18, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 42, type: !4)
!21 = !DILocation(line: 42, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 44, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 44, column: 12, scope: !16)
!27 = !DILocation(line: 45, column: 10, scope: !16)
!28 = !DILocation(line: 47, column: 23, scope: !16)
!29 = !DILocation(line: 47, column: 12, scope: !16)
!30 = !DILocation(line: 47, column: 10, scope: !16)
!31 = !DILocation(line: 48, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 48, column: 9)
!33 = !DILocation(line: 48, column: 14, scope: !32)
!34 = !DILocation(line: 48, column: 9, scope: !16)
!35 = !DILocation(line: 48, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 48, column: 23)
!37 = !DILocation(line: 50, column: 5, scope: !16)
!38 = !DILocation(line: 50, column: 13, scope: !16)
!39 = !DILocation(line: 51, column: 1, scope: !16)
!40 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 28, type: !24, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !17, line: 28, type: !4)
!42 = !DILocation(line: 28, column: 31, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !17, line: 31, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 30, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 31, column: 17, scope: !44)
!49 = !DILocation(line: 34, column: 17, scope: !44)
!50 = !DILocation(line: 34, column: 23, scope: !44)
!51 = !DILocation(line: 34, column: 38, scope: !44)
!52 = !DILocation(line: 34, column: 31, scope: !44)
!53 = !DILocation(line: 34, column: 46, scope: !44)
!54 = !DILocation(line: 34, column: 9, scope: !44)
!55 = !DILocation(line: 35, column: 20, scope: !44)
!56 = !DILocation(line: 35, column: 9, scope: !44)
!57 = !DILocation(line: 36, column: 14, scope: !44)
!58 = !DILocation(line: 36, column: 9, scope: !44)
!59 = !DILocation(line: 38, column: 1, scope: !40)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_44_good", scope: !17, file: !17, line: 81, type: !18, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 83, column: 5, scope: !60)
!62 = !DILocation(line: 84, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 95, type: !64, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 95, type: !7)
!70 = !DILocation(line: 95, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 95, type: !66)
!72 = !DILocation(line: 95, column: 27, scope: !63)
!73 = !DILocation(line: 98, column: 22, scope: !63)
!74 = !DILocation(line: 98, column: 12, scope: !63)
!75 = !DILocation(line: 98, column: 5, scope: !63)
!76 = !DILocation(line: 100, column: 5, scope: !63)
!77 = !DILocation(line: 101, column: 5, scope: !63)
!78 = !DILocation(line: 102, column: 5, scope: !63)
!79 = !DILocation(line: 105, column: 5, scope: !63)
!80 = !DILocation(line: 106, column: 5, scope: !63)
!81 = !DILocation(line: 107, column: 5, scope: !63)
!82 = !DILocation(line: 109, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 70, type: !18, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 72, type: !4)
!85 = !DILocation(line: 72, column: 15, scope: !83)
!86 = !DILocalVariable(name: "funcPtr", scope: !83, file: !17, line: 73, type: !23)
!87 = !DILocation(line: 73, column: 12, scope: !83)
!88 = !DILocation(line: 74, column: 10, scope: !83)
!89 = !DILocation(line: 76, column: 23, scope: !83)
!90 = !DILocation(line: 76, column: 12, scope: !83)
!91 = !DILocation(line: 76, column: 10, scope: !83)
!92 = !DILocation(line: 77, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !17, line: 77, column: 9)
!94 = !DILocation(line: 77, column: 14, scope: !93)
!95 = !DILocation(line: 77, column: 9, scope: !83)
!96 = !DILocation(line: 77, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 77, column: 23)
!98 = !DILocation(line: 78, column: 5, scope: !83)
!99 = !DILocation(line: 78, column: 13, scope: !83)
!100 = !DILocation(line: 79, column: 1, scope: !83)
!101 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 58, type: !24, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", arg: 1, scope: !101, file: !17, line: 58, type: !4)
!103 = !DILocation(line: 58, column: 35, scope: !101)
!104 = !DILocalVariable(name: "source", scope: !105, file: !17, line: 61, type: !45)
!105 = distinct !DILexicalBlock(scope: !101, file: !17, line: 60, column: 5)
!106 = !DILocation(line: 61, column: 17, scope: !105)
!107 = !DILocation(line: 64, column: 17, scope: !105)
!108 = !DILocation(line: 64, column: 23, scope: !105)
!109 = !DILocation(line: 64, column: 38, scope: !105)
!110 = !DILocation(line: 64, column: 31, scope: !105)
!111 = !DILocation(line: 64, column: 46, scope: !105)
!112 = !DILocation(line: 64, column: 9, scope: !105)
!113 = !DILocation(line: 65, column: 20, scope: !105)
!114 = !DILocation(line: 65, column: 9, scope: !105)
!115 = !DILocation(line: 66, column: 14, scope: !105)
!116 = !DILocation(line: 66, column: 9, scope: !105)
!117 = !DILocation(line: 68, column: 1, scope: !101)
