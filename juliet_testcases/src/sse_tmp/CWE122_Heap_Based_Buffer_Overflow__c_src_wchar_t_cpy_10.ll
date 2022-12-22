; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10_bad() #0 !dbg !16 {
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
  %2 = load i32, i32* @globalTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %2, 0, !dbg !31
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !33

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !36
  %4 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end3, !dbg !39

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  %call4 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #6, !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %7), !dbg !50
  %8 = load i32*, i32** %data, align 8, !dbg !51
  %9 = bitcast i32* %8 to i8*, !dbg !51
  call void @free(i8* %9) #6, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !81
  %0 = bitcast i8* %call to i32*, !dbg !82
  store i32* %0, i32** %data, align 8, !dbg !83
  %1 = load i32*, i32** %data, align 8, !dbg !84
  %cmp = icmp eq i32* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFalse, align 4, !dbg !90
  %tobool = icmp ne i32 %2, 0, !dbg !90
  br i1 %tobool, label %if.then1, label %if.else, !dbg !92

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end3, !dbg !95

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !96
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !98
  %4 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !104
  %6 = load i32*, i32** %data, align 8, !dbg !105
  %call4 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #6, !dbg !106
  %7 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %7), !dbg !108
  %8 = load i32*, i32** %data, align 8, !dbg !109
  %9 = bitcast i32* %8 to i8*, !dbg !109
  call void @free(i8* %9) #6, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !115
  %0 = bitcast i8* %call to i32*, !dbg !116
  store i32* %0, i32** %data, align 8, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalTrue, align 4, !dbg !124
  %tobool = icmp ne i32 %2, 0, !dbg !124
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !126

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !127
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !129
  %4 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  br label %if.end3, !dbg !132

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !135
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !136
  %6 = load i32*, i32** %data, align 8, !dbg !137
  %call4 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #6, !dbg !138
  %7 = load i32*, i32** %data, align 8, !dbg !139
  call void @printWLine(i32* %7), !dbg !140
  %8 = load i32*, i32** %data, align 8, !dbg !141
  %9 = bitcast i32* %8 to i8*, !dbg !141
  call void @free(i8* %9) #6, !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 8, scope: !16)
!34 = !DILocation(line: 31, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 29, column: 5)
!36 = !DILocation(line: 31, column: 9, scope: !35)
!37 = !DILocation(line: 32, column: 9, scope: !35)
!38 = !DILocation(line: 32, column: 21, scope: !35)
!39 = !DILocation(line: 33, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !17, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 35, column: 17, scope: !41)
!46 = !DILocation(line: 37, column: 16, scope: !41)
!47 = !DILocation(line: 37, column: 22, scope: !41)
!48 = !DILocation(line: 37, column: 9, scope: !41)
!49 = !DILocation(line: 38, column: 20, scope: !41)
!50 = !DILocation(line: 38, column: 9, scope: !41)
!51 = !DILocation(line: 39, column: 14, scope: !41)
!52 = !DILocation(line: 39, column: 9, scope: !41)
!53 = !DILocation(line: 41, column: 1, scope: !16)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cpy_10_good", scope: !17, file: !17, line: 94, type: !18, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 96, column: 5, scope: !54)
!56 = !DILocation(line: 97, column: 5, scope: !54)
!57 = !DILocation(line: 98, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 110, type: !59, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !17, line: 110, type: !7)
!65 = !DILocation(line: 110, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !17, line: 110, type: !61)
!67 = !DILocation(line: 110, column: 27, scope: !58)
!68 = !DILocation(line: 113, column: 22, scope: !58)
!69 = !DILocation(line: 113, column: 12, scope: !58)
!70 = !DILocation(line: 113, column: 5, scope: !58)
!71 = !DILocation(line: 115, column: 5, scope: !58)
!72 = !DILocation(line: 116, column: 5, scope: !58)
!73 = !DILocation(line: 117, column: 5, scope: !58)
!74 = !DILocation(line: 120, column: 5, scope: !58)
!75 = !DILocation(line: 121, column: 5, scope: !58)
!76 = !DILocation(line: 122, column: 5, scope: !58)
!77 = !DILocation(line: 124, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 48, type: !18, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !17, line: 50, type: !4)
!80 = !DILocation(line: 50, column: 15, scope: !78)
!81 = !DILocation(line: 51, column: 23, scope: !78)
!82 = !DILocation(line: 51, column: 12, scope: !78)
!83 = !DILocation(line: 51, column: 10, scope: !78)
!84 = !DILocation(line: 52, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !17, line: 52, column: 9)
!86 = !DILocation(line: 52, column: 14, scope: !85)
!87 = !DILocation(line: 52, column: 9, scope: !78)
!88 = !DILocation(line: 52, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !17, line: 52, column: 23)
!90 = !DILocation(line: 53, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !78, file: !17, line: 53, column: 8)
!92 = !DILocation(line: 53, column: 8, scope: !78)
!93 = !DILocation(line: 56, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !17, line: 54, column: 5)
!95 = !DILocation(line: 57, column: 5, scope: !94)
!96 = !DILocation(line: 61, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !17, line: 59, column: 5)
!98 = !DILocation(line: 61, column: 9, scope: !97)
!99 = !DILocation(line: 62, column: 9, scope: !97)
!100 = !DILocation(line: 62, column: 20, scope: !97)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !17, line: 65, type: !42)
!102 = distinct !DILexicalBlock(scope: !78, file: !17, line: 64, column: 5)
!103 = !DILocation(line: 65, column: 17, scope: !102)
!104 = !DILocation(line: 67, column: 16, scope: !102)
!105 = !DILocation(line: 67, column: 22, scope: !102)
!106 = !DILocation(line: 67, column: 9, scope: !102)
!107 = !DILocation(line: 68, column: 20, scope: !102)
!108 = !DILocation(line: 68, column: 9, scope: !102)
!109 = !DILocation(line: 69, column: 14, scope: !102)
!110 = !DILocation(line: 69, column: 9, scope: !102)
!111 = !DILocation(line: 71, column: 1, scope: !78)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 74, type: !18, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 76, type: !4)
!114 = !DILocation(line: 76, column: 15, scope: !112)
!115 = !DILocation(line: 77, column: 23, scope: !112)
!116 = !DILocation(line: 77, column: 12, scope: !112)
!117 = !DILocation(line: 77, column: 10, scope: !112)
!118 = !DILocation(line: 78, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !17, line: 78, column: 9)
!120 = !DILocation(line: 78, column: 14, scope: !119)
!121 = !DILocation(line: 78, column: 9, scope: !112)
!122 = !DILocation(line: 78, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 78, column: 23)
!124 = !DILocation(line: 79, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !112, file: !17, line: 79, column: 8)
!126 = !DILocation(line: 79, column: 8, scope: !112)
!127 = !DILocation(line: 82, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !17, line: 80, column: 5)
!129 = !DILocation(line: 82, column: 9, scope: !128)
!130 = !DILocation(line: 83, column: 9, scope: !128)
!131 = !DILocation(line: 83, column: 20, scope: !128)
!132 = !DILocation(line: 84, column: 5, scope: !128)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !17, line: 86, type: !42)
!134 = distinct !DILexicalBlock(scope: !112, file: !17, line: 85, column: 5)
!135 = !DILocation(line: 86, column: 17, scope: !134)
!136 = !DILocation(line: 88, column: 16, scope: !134)
!137 = !DILocation(line: 88, column: 22, scope: !134)
!138 = !DILocation(line: 88, column: 9, scope: !134)
!139 = !DILocation(line: 89, column: 20, scope: !134)
!140 = !DILocation(line: 89, column: 9, scope: !134)
!141 = !DILocation(line: 90, column: 14, scope: !134)
!142 = !DILocation(line: 90, column: 9, scope: !134)
!143 = !DILocation(line: 92, column: 1, scope: !112)
