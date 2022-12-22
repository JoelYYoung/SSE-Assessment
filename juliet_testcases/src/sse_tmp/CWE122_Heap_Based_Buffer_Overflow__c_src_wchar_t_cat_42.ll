; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @badSource(i32* %2), !dbg !32
  store i32* %call1, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %4) #6, !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* %5), !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %7 = bitcast i32* %6 to i8*, !dbg !45
  call void @free(i8* %7) #6, !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32*, i32** %data.addr, align 8, !dbg !53
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !54
  %1 = load i32*, i32** %data.addr, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !56
  %2 = load i32*, i32** %data.addr, align 8, !dbg !57
  ret i32* %2, !dbg !58
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !85
  %0 = bitcast i8* %call to i32*, !dbg !86
  store i32* %0, i32** %data, align 8, !dbg !87
  %1 = load i32*, i32** %data, align 8, !dbg !88
  %cmp = icmp eq i32* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %call1 = call i32* @goodG2BSource(i32* %2), !dbg !95
  store i32* %call1, i32** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !100
  %4 = load i32*, i32** %data, align 8, !dbg !101
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %4) #6, !dbg !102
  %5 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %5), !dbg !104
  %6 = load i32*, i32** %data, align 8, !dbg !105
  %7 = bitcast i32* %6 to i8*, !dbg !105
  call void @free(i8* %7) #6, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !108 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load i32*, i32** %data.addr, align 8, !dbg !111
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !112
  %1 = load i32*, i32** %data.addr, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %2 = load i32*, i32** %data.addr, align 8, !dbg !115
  ret i32* %2, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42_bad", scope: !17, file: !17, line: 31, type: !18, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 33, type: !4)
!21 = !DILocation(line: 33, column: 15, scope: !16)
!22 = !DILocation(line: 34, column: 23, scope: !16)
!23 = !DILocation(line: 34, column: 12, scope: !16)
!24 = !DILocation(line: 34, column: 10, scope: !16)
!25 = !DILocation(line: 35, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 9)
!27 = !DILocation(line: 35, column: 14, scope: !26)
!28 = !DILocation(line: 35, column: 9, scope: !16)
!29 = !DILocation(line: 35, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 35, column: 23)
!31 = !DILocation(line: 36, column: 22, scope: !16)
!32 = !DILocation(line: 36, column: 12, scope: !16)
!33 = !DILocation(line: 36, column: 10, scope: !16)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !17, line: 38, type: !36)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 38, column: 17, scope: !35)
!40 = !DILocation(line: 40, column: 16, scope: !35)
!41 = !DILocation(line: 40, column: 22, scope: !35)
!42 = !DILocation(line: 40, column: 9, scope: !35)
!43 = !DILocation(line: 41, column: 20, scope: !35)
!44 = !DILocation(line: 41, column: 9, scope: !35)
!45 = !DILocation(line: 42, column: 14, scope: !35)
!46 = !DILocation(line: 42, column: 9, scope: !35)
!47 = !DILocation(line: 44, column: 1, scope: !16)
!48 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !49, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!4, !4}
!51 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !17, line: 23, type: !4)
!52 = !DILocation(line: 23, column: 38, scope: !48)
!53 = !DILocation(line: 26, column: 13, scope: !48)
!54 = !DILocation(line: 26, column: 5, scope: !48)
!55 = !DILocation(line: 27, column: 5, scope: !48)
!56 = !DILocation(line: 27, column: 17, scope: !48)
!57 = !DILocation(line: 28, column: 12, scope: !48)
!58 = !DILocation(line: 28, column: 5, scope: !48)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_42_good", scope: !17, file: !17, line: 74, type: !18, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 76, column: 5, scope: !59)
!61 = !DILocation(line: 77, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 89, type: !63, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 89, type: !7)
!69 = !DILocation(line: 89, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 89, type: !65)
!71 = !DILocation(line: 89, column: 27, scope: !62)
!72 = !DILocation(line: 92, column: 22, scope: !62)
!73 = !DILocation(line: 92, column: 12, scope: !62)
!74 = !DILocation(line: 92, column: 5, scope: !62)
!75 = !DILocation(line: 94, column: 5, scope: !62)
!76 = !DILocation(line: 95, column: 5, scope: !62)
!77 = !DILocation(line: 96, column: 5, scope: !62)
!78 = !DILocation(line: 99, column: 5, scope: !62)
!79 = !DILocation(line: 100, column: 5, scope: !62)
!80 = !DILocation(line: 101, column: 5, scope: !62)
!81 = !DILocation(line: 103, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 61, type: !4)
!84 = !DILocation(line: 61, column: 15, scope: !82)
!85 = !DILocation(line: 62, column: 23, scope: !82)
!86 = !DILocation(line: 62, column: 12, scope: !82)
!87 = !DILocation(line: 62, column: 10, scope: !82)
!88 = !DILocation(line: 63, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !17, line: 63, column: 9)
!90 = !DILocation(line: 63, column: 14, scope: !89)
!91 = !DILocation(line: 63, column: 9, scope: !82)
!92 = !DILocation(line: 63, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !17, line: 63, column: 23)
!94 = !DILocation(line: 64, column: 26, scope: !82)
!95 = !DILocation(line: 64, column: 12, scope: !82)
!96 = !DILocation(line: 64, column: 10, scope: !82)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !17, line: 66, type: !36)
!98 = distinct !DILexicalBlock(scope: !82, file: !17, line: 65, column: 5)
!99 = !DILocation(line: 66, column: 17, scope: !98)
!100 = !DILocation(line: 68, column: 16, scope: !98)
!101 = !DILocation(line: 68, column: 22, scope: !98)
!102 = !DILocation(line: 68, column: 9, scope: !98)
!103 = !DILocation(line: 69, column: 20, scope: !98)
!104 = !DILocation(line: 69, column: 9, scope: !98)
!105 = !DILocation(line: 70, column: 14, scope: !98)
!106 = !DILocation(line: 70, column: 9, scope: !98)
!107 = !DILocation(line: 72, column: 1, scope: !82)
!108 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 50, type: !49, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", arg: 1, scope: !108, file: !17, line: 50, type: !4)
!110 = !DILocation(line: 50, column: 42, scope: !108)
!111 = !DILocation(line: 53, column: 13, scope: !108)
!112 = !DILocation(line: 53, column: 5, scope: !108)
!113 = !DILocation(line: 54, column: 5, scope: !108)
!114 = !DILocation(line: 54, column: 16, scope: !108)
!115 = !DILocation(line: 55, column: 12, scope: !108)
!116 = !DILocation(line: 55, column: 5, scope: !108)
