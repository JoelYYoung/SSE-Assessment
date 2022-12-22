; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end2, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !33
  store i32* %1, i32** %data, align 8, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %cmp = icmp eq i32* %2, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end2, !dbg !43

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx4, align 4, !dbg !53
  %4 = load i32*, i32** %data, align 8, !dbg !54
  %5 = bitcast i32* %4 to i8*, !dbg !55
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %6 = bitcast i32* %arraydecay5 to i8*, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !55
  %7 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !56
  store i32 0, i32* %arrayidx6, align 4, !dbg !57
  %8 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* %8), !dbg !59
  %9 = load i32*, i32** %data, align 8, !dbg !60
  %10 = bitcast i32* %9 to i8*, !dbg !60
  call void @free(i8* %10) #6, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %0 = load i32, i32* @staticFalse, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end2, !dbg !96

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !97
  %1 = bitcast i8* %call to i32*, !dbg !99
  store i32* %1, i32** %data, align 8, !dbg !100
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %cmp = icmp eq i32* %2, null, !dbg !103
  br i1 %cmp, label %if.then1, label %if.end, !dbg !104

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !113
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx4, align 4, !dbg !115
  %4 = load i32*, i32** %data, align 8, !dbg !116
  %5 = bitcast i32* %4 to i8*, !dbg !117
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %6 = bitcast i32* %arraydecay5 to i8*, !dbg !117
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !117
  %7 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !118
  store i32 0, i32* %arrayidx6, align 4, !dbg !119
  %8 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %8), !dbg !121
  %9 = load i32*, i32** %data, align 8, !dbg !122
  %10 = bitcast i32* %9 to i8*, !dbg !122
  call void @free(i8* %10) #6, !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i32* null, i32** %data, align 8, !dbg !128
  %0 = load i32, i32* @staticTrue, align 4, !dbg !129
  %tobool = icmp ne i32 %0, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end2, !dbg !131

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !132
  %1 = bitcast i8* %call to i32*, !dbg !134
  store i32* %1, i32** %data, align 8, !dbg !135
  %2 = load i32*, i32** %data, align 8, !dbg !136
  %cmp = icmp eq i32* %2, null, !dbg !138
  br i1 %cmp, label %if.then1, label %if.end, !dbg !139

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !142
  store i32 0, i32* %arrayidx, align 4, !dbg !143
  br label %if.end2, !dbg !144

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !145, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !148
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !149
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx4, align 4, !dbg !151
  %4 = load i32*, i32** %data, align 8, !dbg !152
  %5 = bitcast i32* %4 to i8*, !dbg !153
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !153
  %6 = bitcast i32* %arraydecay5 to i8*, !dbg !153
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !153
  %7 = load i32*, i32** %data, align 8, !dbg !154
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !154
  store i32 0, i32* %arrayidx6, align 4, !dbg !155
  %8 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %8), !dbg !157
  %9 = load i32*, i32** %data, align 8, !dbg !158
  %10 = bitcast i32* %9 to i8*, !dbg !158
  call void @free(i8* %10) #6, !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05.c", directory: "/root/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 10, scope: !22)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !22)
!31 = !DILocation(line: 37, column: 27, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 16, scope: !32)
!34 = !DILocation(line: 37, column: 14, scope: !32)
!35 = !DILocation(line: 38, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 13)
!37 = !DILocation(line: 38, column: 18, scope: !36)
!38 = !DILocation(line: 38, column: 13, scope: !32)
!39 = !DILocation(line: 38, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 38, column: 27)
!41 = !DILocation(line: 39, column: 9, scope: !32)
!42 = !DILocation(line: 39, column: 17, scope: !32)
!43 = !DILocation(line: 40, column: 5, scope: !32)
!44 = !DILocalVariable(name: "source", scope: !45, file: !15, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 42, column: 17, scope: !45)
!50 = !DILocation(line: 43, column: 17, scope: !45)
!51 = !DILocation(line: 43, column: 9, scope: !45)
!52 = !DILocation(line: 44, column: 9, scope: !45)
!53 = !DILocation(line: 44, column: 23, scope: !45)
!54 = !DILocation(line: 46, column: 17, scope: !45)
!55 = !DILocation(line: 46, column: 9, scope: !45)
!56 = !DILocation(line: 47, column: 9, scope: !45)
!57 = !DILocation(line: 47, column: 21, scope: !45)
!58 = !DILocation(line: 48, column: 20, scope: !45)
!59 = !DILocation(line: 48, column: 9, scope: !45)
!60 = !DILocation(line: 49, column: 14, scope: !45)
!61 = !DILocation(line: 49, column: 9, scope: !45)
!62 = !DILocation(line: 51, column: 1, scope: !22)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_05_good", scope: !15, file: !15, line: 110, type: !23, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 112, column: 5, scope: !63)
!65 = !DILocation(line: 113, column: 5, scope: !63)
!66 = !DILocation(line: 114, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 126, type: !68, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!9, !9, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 126, type: !9)
!74 = !DILocation(line: 126, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 126, type: !70)
!76 = !DILocation(line: 126, column: 27, scope: !67)
!77 = !DILocation(line: 129, column: 22, scope: !67)
!78 = !DILocation(line: 129, column: 12, scope: !67)
!79 = !DILocation(line: 129, column: 5, scope: !67)
!80 = !DILocation(line: 131, column: 5, scope: !67)
!81 = !DILocation(line: 132, column: 5, scope: !67)
!82 = !DILocation(line: 133, column: 5, scope: !67)
!83 = !DILocation(line: 136, column: 5, scope: !67)
!84 = !DILocation(line: 137, column: 5, scope: !67)
!85 = !DILocation(line: 138, column: 5, scope: !67)
!86 = !DILocation(line: 140, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !23, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 60, type: !6)
!89 = !DILocation(line: 60, column: 15, scope: !87)
!90 = !DILocation(line: 61, column: 10, scope: !87)
!91 = !DILocation(line: 62, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !15, line: 62, column: 8)
!93 = !DILocation(line: 62, column: 8, scope: !87)
!94 = !DILocation(line: 65, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !15, line: 63, column: 5)
!96 = !DILocation(line: 66, column: 5, scope: !95)
!97 = !DILocation(line: 70, column: 27, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !15, line: 68, column: 5)
!99 = !DILocation(line: 70, column: 16, scope: !98)
!100 = !DILocation(line: 70, column: 14, scope: !98)
!101 = !DILocation(line: 71, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 71, column: 13)
!103 = !DILocation(line: 71, column: 18, scope: !102)
!104 = !DILocation(line: 71, column: 13, scope: !98)
!105 = !DILocation(line: 71, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 71, column: 27)
!107 = !DILocation(line: 72, column: 9, scope: !98)
!108 = !DILocation(line: 72, column: 17, scope: !98)
!109 = !DILocalVariable(name: "source", scope: !110, file: !15, line: 75, type: !46)
!110 = distinct !DILexicalBlock(scope: !87, file: !15, line: 74, column: 5)
!111 = !DILocation(line: 75, column: 17, scope: !110)
!112 = !DILocation(line: 76, column: 17, scope: !110)
!113 = !DILocation(line: 76, column: 9, scope: !110)
!114 = !DILocation(line: 77, column: 9, scope: !110)
!115 = !DILocation(line: 77, column: 23, scope: !110)
!116 = !DILocation(line: 79, column: 17, scope: !110)
!117 = !DILocation(line: 79, column: 9, scope: !110)
!118 = !DILocation(line: 80, column: 9, scope: !110)
!119 = !DILocation(line: 80, column: 21, scope: !110)
!120 = !DILocation(line: 81, column: 20, scope: !110)
!121 = !DILocation(line: 81, column: 9, scope: !110)
!122 = !DILocation(line: 82, column: 14, scope: !110)
!123 = !DILocation(line: 82, column: 9, scope: !110)
!124 = !DILocation(line: 84, column: 1, scope: !87)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 87, type: !23, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !15, line: 89, type: !6)
!127 = !DILocation(line: 89, column: 15, scope: !125)
!128 = !DILocation(line: 90, column: 10, scope: !125)
!129 = !DILocation(line: 91, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !15, line: 91, column: 8)
!131 = !DILocation(line: 91, column: 8, scope: !125)
!132 = !DILocation(line: 94, column: 27, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !15, line: 92, column: 5)
!134 = !DILocation(line: 94, column: 16, scope: !133)
!135 = !DILocation(line: 94, column: 14, scope: !133)
!136 = !DILocation(line: 95, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 95, column: 13)
!138 = !DILocation(line: 95, column: 18, scope: !137)
!139 = !DILocation(line: 95, column: 13, scope: !133)
!140 = !DILocation(line: 95, column: 28, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !15, line: 95, column: 27)
!142 = !DILocation(line: 96, column: 9, scope: !133)
!143 = !DILocation(line: 96, column: 17, scope: !133)
!144 = !DILocation(line: 97, column: 5, scope: !133)
!145 = !DILocalVariable(name: "source", scope: !146, file: !15, line: 99, type: !46)
!146 = distinct !DILexicalBlock(scope: !125, file: !15, line: 98, column: 5)
!147 = !DILocation(line: 99, column: 17, scope: !146)
!148 = !DILocation(line: 100, column: 17, scope: !146)
!149 = !DILocation(line: 100, column: 9, scope: !146)
!150 = !DILocation(line: 101, column: 9, scope: !146)
!151 = !DILocation(line: 101, column: 23, scope: !146)
!152 = !DILocation(line: 103, column: 17, scope: !146)
!153 = !DILocation(line: 103, column: 9, scope: !146)
!154 = !DILocation(line: 104, column: 9, scope: !146)
!155 = !DILocation(line: 104, column: 21, scope: !146)
!156 = !DILocation(line: 105, column: 20, scope: !146)
!157 = !DILocation(line: 105, column: 9, scope: !146)
!158 = !DILocation(line: 106, column: 14, scope: !146)
!159 = !DILocation(line: 106, column: 9, scope: !146)
!160 = !DILocation(line: 108, column: 1, scope: !125)
