; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %2, 0, !dbg !36
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !38

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end3, !dbg !44

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  %call4 = call i32* @wcscat(i32* %arraydecay, i32* %6) #6, !dbg !53
  %7 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %7), !dbg !55
  %8 = load i32*, i32** %data, align 8, !dbg !56
  %9 = bitcast i32* %8 to i8*, !dbg !56
  call void @free(i8* %9) #6, !dbg !57
  ret void, !dbg !58
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
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
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
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !86
  %0 = bitcast i8* %call to i32*, !dbg !87
  store i32* %0, i32** %data, align 8, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %cmp = icmp eq i32* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFalse, align 4, !dbg !95
  %tobool = icmp ne i32 %2, 0, !dbg !95
  br i1 %tobool, label %if.then1, label %if.else, !dbg !97

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end3, !dbg !100

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !103
  %4 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !109
  %6 = load i32*, i32** %data, align 8, !dbg !110
  %call4 = call i32* @wcscat(i32* %arraydecay, i32* %6) #6, !dbg !111
  %7 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %7), !dbg !113
  %8 = load i32*, i32** %data, align 8, !dbg !114
  %9 = bitcast i32* %8 to i8*, !dbg !114
  call void @free(i8* %9) #6, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !120
  %0 = bitcast i8* %call to i32*, !dbg !121
  store i32* %0, i32** %data, align 8, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %cmp = icmp eq i32* %1, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !129
  %tobool = icmp ne i32 %2, 0, !dbg !129
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !131

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !132
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !134
  %4 = load i32*, i32** %data, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  br label %if.end3, !dbg !137

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !138, metadata !DIExpression()), !dbg !140
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !140
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !141
  %6 = load i32*, i32** %data, align 8, !dbg !142
  %call4 = call i32* @wcscat(i32* %arraydecay, i32* %6) #6, !dbg !143
  %7 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* %7), !dbg !145
  %8 = load i32*, i32** %data, align 8, !dbg !146
  %9 = bitcast i32* %8 to i8*, !dbg !146
  call void @free(i8* %9) #6, !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 23, scope: !22)
!28 = !DILocation(line: 33, column: 12, scope: !22)
!29 = !DILocation(line: 33, column: 10, scope: !22)
!30 = !DILocation(line: 34, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 9)
!32 = !DILocation(line: 34, column: 14, scope: !31)
!33 = !DILocation(line: 34, column: 9, scope: !22)
!34 = !DILocation(line: 34, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 34, column: 23)
!36 = !DILocation(line: 35, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !15, line: 35, column: 8)
!38 = !DILocation(line: 35, column: 8, scope: !22)
!39 = !DILocation(line: 38, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 36, column: 5)
!41 = !DILocation(line: 38, column: 9, scope: !40)
!42 = !DILocation(line: 39, column: 9, scope: !40)
!43 = !DILocation(line: 39, column: 21, scope: !40)
!44 = !DILocation(line: 40, column: 5, scope: !40)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !15, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 42, column: 17, scope: !46)
!51 = !DILocation(line: 44, column: 16, scope: !46)
!52 = !DILocation(line: 44, column: 22, scope: !46)
!53 = !DILocation(line: 44, column: 9, scope: !46)
!54 = !DILocation(line: 45, column: 20, scope: !46)
!55 = !DILocation(line: 45, column: 9, scope: !46)
!56 = !DILocation(line: 46, column: 14, scope: !46)
!57 = !DILocation(line: 46, column: 9, scope: !46)
!58 = !DILocation(line: 48, column: 1, scope: !22)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_05_good", scope: !15, file: !15, line: 101, type: !23, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 103, column: 5, scope: !59)
!61 = !DILocation(line: 104, column: 5, scope: !59)
!62 = !DILocation(line: 105, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 117, type: !64, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!9, !9, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 117, type: !9)
!70 = !DILocation(line: 117, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 117, type: !66)
!72 = !DILocation(line: 117, column: 27, scope: !63)
!73 = !DILocation(line: 120, column: 22, scope: !63)
!74 = !DILocation(line: 120, column: 12, scope: !63)
!75 = !DILocation(line: 120, column: 5, scope: !63)
!76 = !DILocation(line: 122, column: 5, scope: !63)
!77 = !DILocation(line: 123, column: 5, scope: !63)
!78 = !DILocation(line: 124, column: 5, scope: !63)
!79 = !DILocation(line: 127, column: 5, scope: !63)
!80 = !DILocation(line: 128, column: 5, scope: !63)
!81 = !DILocation(line: 129, column: 5, scope: !63)
!82 = !DILocation(line: 131, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 55, type: !23, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !15, line: 57, type: !6)
!85 = !DILocation(line: 57, column: 15, scope: !83)
!86 = !DILocation(line: 58, column: 23, scope: !83)
!87 = !DILocation(line: 58, column: 12, scope: !83)
!88 = !DILocation(line: 58, column: 10, scope: !83)
!89 = !DILocation(line: 59, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !15, line: 59, column: 9)
!91 = !DILocation(line: 59, column: 14, scope: !90)
!92 = !DILocation(line: 59, column: 9, scope: !83)
!93 = !DILocation(line: 59, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 59, column: 23)
!95 = !DILocation(line: 60, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !83, file: !15, line: 60, column: 8)
!97 = !DILocation(line: 60, column: 8, scope: !83)
!98 = !DILocation(line: 63, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !15, line: 61, column: 5)
!100 = !DILocation(line: 64, column: 5, scope: !99)
!101 = !DILocation(line: 68, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !15, line: 66, column: 5)
!103 = !DILocation(line: 68, column: 9, scope: !102)
!104 = !DILocation(line: 69, column: 9, scope: !102)
!105 = !DILocation(line: 69, column: 20, scope: !102)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !15, line: 72, type: !47)
!107 = distinct !DILexicalBlock(scope: !83, file: !15, line: 71, column: 5)
!108 = !DILocation(line: 72, column: 17, scope: !107)
!109 = !DILocation(line: 74, column: 16, scope: !107)
!110 = !DILocation(line: 74, column: 22, scope: !107)
!111 = !DILocation(line: 74, column: 9, scope: !107)
!112 = !DILocation(line: 75, column: 20, scope: !107)
!113 = !DILocation(line: 75, column: 9, scope: !107)
!114 = !DILocation(line: 76, column: 14, scope: !107)
!115 = !DILocation(line: 76, column: 9, scope: !107)
!116 = !DILocation(line: 78, column: 1, scope: !83)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 81, type: !23, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 83, type: !6)
!119 = !DILocation(line: 83, column: 15, scope: !117)
!120 = !DILocation(line: 84, column: 23, scope: !117)
!121 = !DILocation(line: 84, column: 12, scope: !117)
!122 = !DILocation(line: 84, column: 10, scope: !117)
!123 = !DILocation(line: 85, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !15, line: 85, column: 9)
!125 = !DILocation(line: 85, column: 14, scope: !124)
!126 = !DILocation(line: 85, column: 9, scope: !117)
!127 = !DILocation(line: 85, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 85, column: 23)
!129 = !DILocation(line: 86, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !117, file: !15, line: 86, column: 8)
!131 = !DILocation(line: 86, column: 8, scope: !117)
!132 = !DILocation(line: 89, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !15, line: 87, column: 5)
!134 = !DILocation(line: 89, column: 9, scope: !133)
!135 = !DILocation(line: 90, column: 9, scope: !133)
!136 = !DILocation(line: 90, column: 20, scope: !133)
!137 = !DILocation(line: 91, column: 5, scope: !133)
!138 = !DILocalVariable(name: "dest", scope: !139, file: !15, line: 93, type: !47)
!139 = distinct !DILexicalBlock(scope: !117, file: !15, line: 92, column: 5)
!140 = !DILocation(line: 93, column: 17, scope: !139)
!141 = !DILocation(line: 95, column: 16, scope: !139)
!142 = !DILocation(line: 95, column: 22, scope: !139)
!143 = !DILocation(line: 95, column: 9, scope: !139)
!144 = !DILocation(line: 96, column: 20, scope: !139)
!145 = !DILocation(line: 96, column: 9, scope: !139)
!146 = !DILocation(line: 97, column: 14, scope: !139)
!147 = !DILocation(line: 97, column: 9, scope: !139)
!148 = !DILocation(line: 99, column: 1, scope: !117)
