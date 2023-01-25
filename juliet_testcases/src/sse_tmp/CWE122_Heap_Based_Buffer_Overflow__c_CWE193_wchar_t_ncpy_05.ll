; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end2, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !33
  store i32* %1, i32** %data, align 8, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %cmp = icmp eq i32* %2, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !41

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05_bad.source to i8*), i64 44, i1 false), !dbg !47
  %4 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call4 = call i64 @wcslen(i32* %arraydecay3) #9, !dbg !51
  %add = add i64 %call4, 1, !dbg !52
  %call5 = call i32* @wcsncpy(i32* %4, i32* %arraydecay, i64 %add) #7, !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %5), !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  %7 = bitcast i32* %6 to i8*, !dbg !56
  call void @free(i8* %7) #7, !dbg !57
  ret void, !dbg !58
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
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05_good() #0 !dbg !59 {
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
  %call = call i64 @time(i64* null) #7, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #7, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  %0 = load i32, i32* @staticFalse, align 4, !dbg !87
  %tobool = icmp ne i32 %0, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end2, !dbg !92

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !93
  %1 = bitcast i8* %call to i32*, !dbg !95
  store i32* %1, i32** %data, align 8, !dbg !96
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %cmp = icmp eq i32* %2, null, !dbg !99
  br i1 %cmp, label %if.then1, label %if.end, !dbg !100

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !106
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !107
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !108
  %call4 = call i64 @wcslen(i32* %arraydecay3) #9, !dbg !109
  %add = add i64 %call4, 1, !dbg !110
  %call5 = call i32* @wcsncpy(i32* %4, i32* %arraydecay, i64 %add) #7, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %5), !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  %7 = bitcast i32* %6 to i8*, !dbg !114
  call void @free(i8* %7) #7, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32* null, i32** %data, align 8, !dbg !120
  %0 = load i32, i32* @staticTrue, align 4, !dbg !121
  %tobool = icmp ne i32 %0, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end2, !dbg !123

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !124
  %1 = bitcast i8* %call to i32*, !dbg !126
  store i32* %1, i32** %data, align 8, !dbg !127
  %2 = load i32*, i32** %data, align 8, !dbg !128
  %cmp = icmp eq i32* %2, null, !dbg !130
  br i1 %cmp, label %if.then1, label %if.end, !dbg !131

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !134

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !135, metadata !DIExpression()), !dbg !137
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !137
  %4 = load i32*, i32** %data, align 8, !dbg !138
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !139
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !140
  %call4 = call i64 @wcslen(i32* %arraydecay3) #9, !dbg !141
  %add = add i64 %call4, 1, !dbg !142
  %call5 = call i32* @wcsncpy(i32* %4, i32* %arraydecay, i64 %add) #7, !dbg !143
  %5 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* %5), !dbg !145
  %6 = load i32*, i32** %data, align 8, !dbg !146
  %7 = bitcast i32* %6 to i8*, !dbg !146
  call void @free(i8* %7) #7, !dbg !147
  ret void, !dbg !148
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 31, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05_bad", scope: !15, file: !15, line: 35, type: !23, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 37, type: !6)
!26 = !DILocation(line: 37, column: 15, scope: !22)
!27 = !DILocation(line: 38, column: 10, scope: !22)
!28 = !DILocation(line: 39, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 39, column: 8)
!30 = !DILocation(line: 39, column: 8, scope: !22)
!31 = !DILocation(line: 42, column: 27, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 40, column: 5)
!33 = !DILocation(line: 42, column: 16, scope: !32)
!34 = !DILocation(line: 42, column: 14, scope: !32)
!35 = !DILocation(line: 43, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 43, column: 13)
!37 = !DILocation(line: 43, column: 18, scope: !36)
!38 = !DILocation(line: 43, column: 13, scope: !32)
!39 = !DILocation(line: 43, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 43, column: 27)
!41 = !DILocation(line: 44, column: 5, scope: !32)
!42 = !DILocalVariable(name: "source", scope: !43, file: !15, line: 46, type: !44)
!43 = distinct !DILexicalBlock(scope: !22, file: !15, line: 45, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 11)
!47 = !DILocation(line: 46, column: 17, scope: !43)
!48 = !DILocation(line: 49, column: 17, scope: !43)
!49 = !DILocation(line: 49, column: 23, scope: !43)
!50 = !DILocation(line: 49, column: 38, scope: !43)
!51 = !DILocation(line: 49, column: 31, scope: !43)
!52 = !DILocation(line: 49, column: 46, scope: !43)
!53 = !DILocation(line: 49, column: 9, scope: !43)
!54 = !DILocation(line: 50, column: 20, scope: !43)
!55 = !DILocation(line: 50, column: 9, scope: !43)
!56 = !DILocation(line: 51, column: 14, scope: !43)
!57 = !DILocation(line: 51, column: 9, scope: !43)
!58 = !DILocation(line: 53, column: 1, scope: !22)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_05_good", scope: !15, file: !15, line: 106, type: !23, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 108, column: 5, scope: !59)
!61 = !DILocation(line: 109, column: 5, scope: !59)
!62 = !DILocation(line: 110, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 122, type: !64, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!9, !9, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 122, type: !9)
!70 = !DILocation(line: 122, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 122, type: !66)
!72 = !DILocation(line: 122, column: 27, scope: !63)
!73 = !DILocation(line: 125, column: 22, scope: !63)
!74 = !DILocation(line: 125, column: 12, scope: !63)
!75 = !DILocation(line: 125, column: 5, scope: !63)
!76 = !DILocation(line: 127, column: 5, scope: !63)
!77 = !DILocation(line: 128, column: 5, scope: !63)
!78 = !DILocation(line: 129, column: 5, scope: !63)
!79 = !DILocation(line: 132, column: 5, scope: !63)
!80 = !DILocation(line: 133, column: 5, scope: !63)
!81 = !DILocation(line: 134, column: 5, scope: !63)
!82 = !DILocation(line: 136, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 60, type: !23, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !15, line: 62, type: !6)
!85 = !DILocation(line: 62, column: 15, scope: !83)
!86 = !DILocation(line: 63, column: 10, scope: !83)
!87 = !DILocation(line: 64, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !15, line: 64, column: 8)
!89 = !DILocation(line: 64, column: 8, scope: !83)
!90 = !DILocation(line: 67, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !15, line: 65, column: 5)
!92 = !DILocation(line: 68, column: 5, scope: !91)
!93 = !DILocation(line: 72, column: 27, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !15, line: 70, column: 5)
!95 = !DILocation(line: 72, column: 16, scope: !94)
!96 = !DILocation(line: 72, column: 14, scope: !94)
!97 = !DILocation(line: 73, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 73, column: 13)
!99 = !DILocation(line: 73, column: 18, scope: !98)
!100 = !DILocation(line: 73, column: 13, scope: !94)
!101 = !DILocation(line: 73, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 73, column: 27)
!103 = !DILocalVariable(name: "source", scope: !104, file: !15, line: 76, type: !44)
!104 = distinct !DILexicalBlock(scope: !83, file: !15, line: 75, column: 5)
!105 = !DILocation(line: 76, column: 17, scope: !104)
!106 = !DILocation(line: 79, column: 17, scope: !104)
!107 = !DILocation(line: 79, column: 23, scope: !104)
!108 = !DILocation(line: 79, column: 38, scope: !104)
!109 = !DILocation(line: 79, column: 31, scope: !104)
!110 = !DILocation(line: 79, column: 46, scope: !104)
!111 = !DILocation(line: 79, column: 9, scope: !104)
!112 = !DILocation(line: 80, column: 20, scope: !104)
!113 = !DILocation(line: 80, column: 9, scope: !104)
!114 = !DILocation(line: 81, column: 14, scope: !104)
!115 = !DILocation(line: 81, column: 9, scope: !104)
!116 = !DILocation(line: 83, column: 1, scope: !83)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 86, type: !23, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 88, type: !6)
!119 = !DILocation(line: 88, column: 15, scope: !117)
!120 = !DILocation(line: 89, column: 10, scope: !117)
!121 = !DILocation(line: 90, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !15, line: 90, column: 8)
!123 = !DILocation(line: 90, column: 8, scope: !117)
!124 = !DILocation(line: 93, column: 27, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !15, line: 91, column: 5)
!126 = !DILocation(line: 93, column: 16, scope: !125)
!127 = !DILocation(line: 93, column: 14, scope: !125)
!128 = !DILocation(line: 94, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 94, column: 13)
!130 = !DILocation(line: 94, column: 18, scope: !129)
!131 = !DILocation(line: 94, column: 13, scope: !125)
!132 = !DILocation(line: 94, column: 28, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 94, column: 27)
!134 = !DILocation(line: 95, column: 5, scope: !125)
!135 = !DILocalVariable(name: "source", scope: !136, file: !15, line: 97, type: !44)
!136 = distinct !DILexicalBlock(scope: !117, file: !15, line: 96, column: 5)
!137 = !DILocation(line: 97, column: 17, scope: !136)
!138 = !DILocation(line: 100, column: 17, scope: !136)
!139 = !DILocation(line: 100, column: 23, scope: !136)
!140 = !DILocation(line: 100, column: 38, scope: !136)
!141 = !DILocation(line: 100, column: 31, scope: !136)
!142 = !DILocation(line: 100, column: 46, scope: !136)
!143 = !DILocation(line: 100, column: 9, scope: !136)
!144 = !DILocation(line: 101, column: 20, scope: !136)
!145 = !DILocation(line: 101, column: 9, scope: !136)
!146 = !DILocation(line: 102, column: 14, scope: !136)
!147 = !DILocation(line: 102, column: 9, scope: !136)
!148 = !DILocation(line: 104, column: 1, scope: !117)
