; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end3, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %data, align 8, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %cmp1 = icmp eq i32* %2, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !50
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx5, align 4, !dbg !52
  %4 = load i32*, i32** %data, align 8, !dbg !53
  %5 = bitcast i32* %4 to i8*, !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %6 = bitcast i32* %arraydecay6 to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !54
  %7 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !55
  store i32 0, i32* %arrayidx7, align 4, !dbg !56
  %8 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %8), !dbg !58
  %9 = load i32*, i32** %data, align 8, !dbg !59
  %10 = bitcast i32* %9 to i8*, !dbg !59
  call void @free(i8* %10) #6, !dbg !60
  ret void, !dbg !61
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32* null, i32** %data, align 8, !dbg !89
  %0 = load i32, i32* @staticFive, align 4, !dbg !90
  %cmp = icmp ne i32 %0, 5, !dbg !92
  br i1 %cmp, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end3, !dbg !96

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !97
  %1 = bitcast i8* %call to i32*, !dbg !99
  store i32* %1, i32** %data, align 8, !dbg !100
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %cmp1 = icmp eq i32* %2, null, !dbg !103
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !104

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !113
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx5, align 4, !dbg !115
  %4 = load i32*, i32** %data, align 8, !dbg !116
  %5 = bitcast i32* %4 to i8*, !dbg !117
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %6 = bitcast i32* %arraydecay6 to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !117
  %7 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !118
  store i32 0, i32* %arrayidx7, align 4, !dbg !119
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !129
  %cmp = icmp eq i32 %0, 5, !dbg !131
  br i1 %cmp, label %if.then, label %if.end3, !dbg !132

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !133
  %1 = bitcast i8* %call to i32*, !dbg !135
  store i32* %1, i32** %data, align 8, !dbg !136
  %2 = load i32*, i32** %data, align 8, !dbg !137
  %cmp1 = icmp eq i32* %2, null, !dbg !139
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !140

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !141
  unreachable, !dbg !141

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !144
  br label %if.end3, !dbg !145

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !146, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !149
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !150
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx5, align 4, !dbg !152
  %4 = load i32*, i32** %data, align 8, !dbg !153
  %5 = bitcast i32* %4 to i8*, !dbg !154
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !154
  %6 = bitcast i32* %arraydecay6 to i8*, !dbg !154
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 400, i1 false), !dbg !154
  %7 = load i32*, i32** %data, align 8, !dbg !155
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !155
  store i32 0, i32* %arrayidx7, align 4, !dbg !156
  %8 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* %8), !dbg !158
  %9 = load i32*, i32** %data, align 8, !dbg !159
  %10 = bitcast i32* %9 to i8*, !dbg !159
  call void @free(i8* %10) #6, !dbg !160
  ret void, !dbg !161
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
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocation(line: 36, column: 27, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!32 = !DILocation(line: 36, column: 16, scope: !31)
!33 = !DILocation(line: 36, column: 14, scope: !31)
!34 = !DILocation(line: 37, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 13)
!36 = !DILocation(line: 37, column: 18, scope: !35)
!37 = !DILocation(line: 37, column: 13, scope: !31)
!38 = !DILocation(line: 37, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 37, column: 27)
!40 = !DILocation(line: 38, column: 9, scope: !31)
!41 = !DILocation(line: 38, column: 17, scope: !31)
!42 = !DILocation(line: 39, column: 5, scope: !31)
!43 = !DILocalVariable(name: "source", scope: !44, file: !13, line: 41, type: !45)
!44 = distinct !DILexicalBlock(scope: !20, file: !13, line: 40, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 41, column: 17, scope: !44)
!49 = !DILocation(line: 42, column: 17, scope: !44)
!50 = !DILocation(line: 42, column: 9, scope: !44)
!51 = !DILocation(line: 43, column: 9, scope: !44)
!52 = !DILocation(line: 43, column: 23, scope: !44)
!53 = !DILocation(line: 45, column: 16, scope: !44)
!54 = !DILocation(line: 45, column: 9, scope: !44)
!55 = !DILocation(line: 46, column: 9, scope: !44)
!56 = !DILocation(line: 46, column: 21, scope: !44)
!57 = !DILocation(line: 47, column: 20, scope: !44)
!58 = !DILocation(line: 47, column: 9, scope: !44)
!59 = !DILocation(line: 48, column: 14, scope: !44)
!60 = !DILocation(line: 48, column: 9, scope: !44)
!61 = !DILocation(line: 50, column: 1, scope: !20)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_07_good", scope: !13, file: !13, line: 109, type: !21, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocation(line: 111, column: 5, scope: !62)
!64 = !DILocation(line: 112, column: 5, scope: !62)
!65 = !DILocation(line: 113, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 125, type: !67, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DISubroutineType(types: !68)
!68 = !{!9, !9, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !13, line: 125, type: !9)
!73 = !DILocation(line: 125, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !13, line: 125, type: !69)
!75 = !DILocation(line: 125, column: 27, scope: !66)
!76 = !DILocation(line: 128, column: 22, scope: !66)
!77 = !DILocation(line: 128, column: 12, scope: !66)
!78 = !DILocation(line: 128, column: 5, scope: !66)
!79 = !DILocation(line: 130, column: 5, scope: !66)
!80 = !DILocation(line: 131, column: 5, scope: !66)
!81 = !DILocation(line: 132, column: 5, scope: !66)
!82 = !DILocation(line: 135, column: 5, scope: !66)
!83 = !DILocation(line: 136, column: 5, scope: !66)
!84 = !DILocation(line: 137, column: 5, scope: !66)
!85 = !DILocation(line: 139, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !13, line: 59, type: !6)
!88 = !DILocation(line: 59, column: 15, scope: !86)
!89 = !DILocation(line: 60, column: 10, scope: !86)
!90 = !DILocation(line: 61, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !13, line: 61, column: 8)
!92 = !DILocation(line: 61, column: 18, scope: !91)
!93 = !DILocation(line: 61, column: 8, scope: !86)
!94 = !DILocation(line: 64, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !13, line: 62, column: 5)
!96 = !DILocation(line: 65, column: 5, scope: !95)
!97 = !DILocation(line: 69, column: 27, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !13, line: 67, column: 5)
!99 = !DILocation(line: 69, column: 16, scope: !98)
!100 = !DILocation(line: 69, column: 14, scope: !98)
!101 = !DILocation(line: 70, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !13, line: 70, column: 13)
!103 = !DILocation(line: 70, column: 18, scope: !102)
!104 = !DILocation(line: 70, column: 13, scope: !98)
!105 = !DILocation(line: 70, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !13, line: 70, column: 27)
!107 = !DILocation(line: 71, column: 9, scope: !98)
!108 = !DILocation(line: 71, column: 17, scope: !98)
!109 = !DILocalVariable(name: "source", scope: !110, file: !13, line: 74, type: !45)
!110 = distinct !DILexicalBlock(scope: !86, file: !13, line: 73, column: 5)
!111 = !DILocation(line: 74, column: 17, scope: !110)
!112 = !DILocation(line: 75, column: 17, scope: !110)
!113 = !DILocation(line: 75, column: 9, scope: !110)
!114 = !DILocation(line: 76, column: 9, scope: !110)
!115 = !DILocation(line: 76, column: 23, scope: !110)
!116 = !DILocation(line: 78, column: 16, scope: !110)
!117 = !DILocation(line: 78, column: 9, scope: !110)
!118 = !DILocation(line: 79, column: 9, scope: !110)
!119 = !DILocation(line: 79, column: 21, scope: !110)
!120 = !DILocation(line: 80, column: 20, scope: !110)
!121 = !DILocation(line: 80, column: 9, scope: !110)
!122 = !DILocation(line: 81, column: 14, scope: !110)
!123 = !DILocation(line: 81, column: 9, scope: !110)
!124 = !DILocation(line: 83, column: 1, scope: !86)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !13, line: 88, type: !6)
!127 = !DILocation(line: 88, column: 15, scope: !125)
!128 = !DILocation(line: 89, column: 10, scope: !125)
!129 = !DILocation(line: 90, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !13, line: 90, column: 8)
!131 = !DILocation(line: 90, column: 18, scope: !130)
!132 = !DILocation(line: 90, column: 8, scope: !125)
!133 = !DILocation(line: 93, column: 27, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !13, line: 91, column: 5)
!135 = !DILocation(line: 93, column: 16, scope: !134)
!136 = !DILocation(line: 93, column: 14, scope: !134)
!137 = !DILocation(line: 94, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !13, line: 94, column: 13)
!139 = !DILocation(line: 94, column: 18, scope: !138)
!140 = !DILocation(line: 94, column: 13, scope: !134)
!141 = !DILocation(line: 94, column: 28, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !13, line: 94, column: 27)
!143 = !DILocation(line: 95, column: 9, scope: !134)
!144 = !DILocation(line: 95, column: 17, scope: !134)
!145 = !DILocation(line: 96, column: 5, scope: !134)
!146 = !DILocalVariable(name: "source", scope: !147, file: !13, line: 98, type: !45)
!147 = distinct !DILexicalBlock(scope: !125, file: !13, line: 97, column: 5)
!148 = !DILocation(line: 98, column: 17, scope: !147)
!149 = !DILocation(line: 99, column: 17, scope: !147)
!150 = !DILocation(line: 99, column: 9, scope: !147)
!151 = !DILocation(line: 100, column: 9, scope: !147)
!152 = !DILocation(line: 100, column: 23, scope: !147)
!153 = !DILocation(line: 102, column: 16, scope: !147)
!154 = !DILocation(line: 102, column: 9, scope: !147)
!155 = !DILocation(line: 103, column: 9, scope: !147)
!156 = !DILocation(line: 103, column: 21, scope: !147)
!157 = !DILocation(line: 104, column: 20, scope: !147)
!158 = !DILocation(line: 104, column: 9, scope: !147)
!159 = !DILocation(line: 105, column: 14, scope: !147)
!160 = !DILocation(line: 105, column: 9, scope: !147)
!161 = !DILocation(line: 107, column: 1, scope: !125)
