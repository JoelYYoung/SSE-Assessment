; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !46
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx5, align 4, !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  %4 = bitcast i32* %3 to i8*, !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %5 = bitcast i32* %arraydecay6 to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !51
  store i32 0, i32* %arrayidx7, align 4, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %7), !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  %9 = bitcast i32* %8 to i8*, !dbg !55
  call void @free(i8* %9) #6, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %call = call i32 (...) @globalReturnsFalse(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end3, !dbg !91

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !92
  %0 = bitcast i8* %call1 to i32*, !dbg !94
  store i32* %0, i32** %data, align 8, !dbg !95
  %1 = load i32*, i32** %data, align 8, !dbg !96
  %cmp = icmp eq i32* %1, null, !dbg !98
  br i1 %cmp, label %if.then2, label %if.end, !dbg !99

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !108
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx5, align 4, !dbg !110
  %3 = load i32*, i32** %data, align 8, !dbg !111
  %4 = bitcast i32* %3 to i8*, !dbg !112
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %5 = bitcast i32* %arraydecay6 to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !112
  %6 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !113
  store i32 0, i32* %arrayidx7, align 4, !dbg !114
  %7 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %7), !dbg !116
  %8 = load i32*, i32** %data, align 8, !dbg !117
  %9 = bitcast i32* %8 to i8*, !dbg !117
  call void @free(i8* %9) #6, !dbg !118
  ret void, !dbg !119
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i32* null, i32** %data, align 8, !dbg !123
  %call = call i32 (...) @globalReturnsTrue(), !dbg !124
  %tobool = icmp ne i32 %call, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end3, !dbg !126

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !127
  %0 = bitcast i8* %call1 to i32*, !dbg !129
  store i32* %0, i32** %data, align 8, !dbg !130
  %1 = load i32*, i32** %data, align 8, !dbg !131
  %cmp = icmp eq i32* %1, null, !dbg !133
  br i1 %cmp, label %if.then2, label %if.end, !dbg !134

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  br label %if.end3, !dbg !139

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !143
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !144
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx5, align 4, !dbg !146
  %3 = load i32*, i32** %data, align 8, !dbg !147
  %4 = bitcast i32* %3 to i8*, !dbg !148
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !148
  %5 = bitcast i32* %arraydecay6 to i8*, !dbg !148
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !148
  %6 = load i32*, i32** %data, align 8, !dbg !149
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !149
  store i32 0, i32* %arrayidx7, align 4, !dbg !150
  %7 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* %7), !dbg !152
  %8 = load i32*, i32** %data, align 8, !dbg !153
  %9 = bitcast i32* %8 to i8*, !dbg !153
  call void @free(i8* %9) #6, !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 14, scope: !27)
!30 = !DILocation(line: 31, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 13)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 13, scope: !27)
!34 = !DILocation(line: 31, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 27)
!36 = !DILocation(line: 32, column: 9, scope: !27)
!37 = !DILocation(line: 32, column: 17, scope: !27)
!38 = !DILocation(line: 33, column: 5, scope: !27)
!39 = !DILocalVariable(name: "source", scope: !40, file: !17, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 35, column: 17, scope: !40)
!45 = !DILocation(line: 36, column: 17, scope: !40)
!46 = !DILocation(line: 36, column: 9, scope: !40)
!47 = !DILocation(line: 37, column: 9, scope: !40)
!48 = !DILocation(line: 37, column: 23, scope: !40)
!49 = !DILocation(line: 39, column: 16, scope: !40)
!50 = !DILocation(line: 39, column: 9, scope: !40)
!51 = !DILocation(line: 40, column: 9, scope: !40)
!52 = !DILocation(line: 40, column: 21, scope: !40)
!53 = !DILocation(line: 41, column: 20, scope: !40)
!54 = !DILocation(line: 41, column: 9, scope: !40)
!55 = !DILocation(line: 42, column: 14, scope: !40)
!56 = !DILocation(line: 42, column: 9, scope: !40)
!57 = !DILocation(line: 44, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_11_good", scope: !17, file: !17, line: 103, type: !18, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 105, column: 5, scope: !58)
!60 = !DILocation(line: 106, column: 5, scope: !58)
!61 = !DILocation(line: 107, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 119, type: !63, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 119, type: !7)
!69 = !DILocation(line: 119, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 119, type: !65)
!71 = !DILocation(line: 119, column: 27, scope: !62)
!72 = !DILocation(line: 122, column: 22, scope: !62)
!73 = !DILocation(line: 122, column: 12, scope: !62)
!74 = !DILocation(line: 122, column: 5, scope: !62)
!75 = !DILocation(line: 124, column: 5, scope: !62)
!76 = !DILocation(line: 125, column: 5, scope: !62)
!77 = !DILocation(line: 126, column: 5, scope: !62)
!78 = !DILocation(line: 129, column: 5, scope: !62)
!79 = !DILocation(line: 130, column: 5, scope: !62)
!80 = !DILocation(line: 131, column: 5, scope: !62)
!81 = !DILocation(line: 133, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 53, type: !4)
!84 = !DILocation(line: 53, column: 15, scope: !82)
!85 = !DILocation(line: 54, column: 10, scope: !82)
!86 = !DILocation(line: 55, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !17, line: 55, column: 8)
!88 = !DILocation(line: 55, column: 8, scope: !82)
!89 = !DILocation(line: 58, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !17, line: 56, column: 5)
!91 = !DILocation(line: 59, column: 5, scope: !90)
!92 = !DILocation(line: 63, column: 27, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !17, line: 61, column: 5)
!94 = !DILocation(line: 63, column: 16, scope: !93)
!95 = !DILocation(line: 63, column: 14, scope: !93)
!96 = !DILocation(line: 64, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 64, column: 13)
!98 = !DILocation(line: 64, column: 18, scope: !97)
!99 = !DILocation(line: 64, column: 13, scope: !93)
!100 = !DILocation(line: 64, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !17, line: 64, column: 27)
!102 = !DILocation(line: 65, column: 9, scope: !93)
!103 = !DILocation(line: 65, column: 17, scope: !93)
!104 = !DILocalVariable(name: "source", scope: !105, file: !17, line: 68, type: !41)
!105 = distinct !DILexicalBlock(scope: !82, file: !17, line: 67, column: 5)
!106 = !DILocation(line: 68, column: 17, scope: !105)
!107 = !DILocation(line: 69, column: 17, scope: !105)
!108 = !DILocation(line: 69, column: 9, scope: !105)
!109 = !DILocation(line: 70, column: 9, scope: !105)
!110 = !DILocation(line: 70, column: 23, scope: !105)
!111 = !DILocation(line: 72, column: 16, scope: !105)
!112 = !DILocation(line: 72, column: 9, scope: !105)
!113 = !DILocation(line: 73, column: 9, scope: !105)
!114 = !DILocation(line: 73, column: 21, scope: !105)
!115 = !DILocation(line: 74, column: 20, scope: !105)
!116 = !DILocation(line: 74, column: 9, scope: !105)
!117 = !DILocation(line: 75, column: 14, scope: !105)
!118 = !DILocation(line: 75, column: 9, scope: !105)
!119 = !DILocation(line: 77, column: 1, scope: !82)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !17, line: 82, type: !4)
!122 = !DILocation(line: 82, column: 15, scope: !120)
!123 = !DILocation(line: 83, column: 10, scope: !120)
!124 = !DILocation(line: 84, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !17, line: 84, column: 8)
!126 = !DILocation(line: 84, column: 8, scope: !120)
!127 = !DILocation(line: 87, column: 27, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !17, line: 85, column: 5)
!129 = !DILocation(line: 87, column: 16, scope: !128)
!130 = !DILocation(line: 87, column: 14, scope: !128)
!131 = !DILocation(line: 88, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !17, line: 88, column: 13)
!133 = !DILocation(line: 88, column: 18, scope: !132)
!134 = !DILocation(line: 88, column: 13, scope: !128)
!135 = !DILocation(line: 88, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 88, column: 27)
!137 = !DILocation(line: 89, column: 9, scope: !128)
!138 = !DILocation(line: 89, column: 17, scope: !128)
!139 = !DILocation(line: 90, column: 5, scope: !128)
!140 = !DILocalVariable(name: "source", scope: !141, file: !17, line: 92, type: !41)
!141 = distinct !DILexicalBlock(scope: !120, file: !17, line: 91, column: 5)
!142 = !DILocation(line: 92, column: 17, scope: !141)
!143 = !DILocation(line: 93, column: 17, scope: !141)
!144 = !DILocation(line: 93, column: 9, scope: !141)
!145 = !DILocation(line: 94, column: 9, scope: !141)
!146 = !DILocation(line: 94, column: 23, scope: !141)
!147 = !DILocation(line: 96, column: 16, scope: !141)
!148 = !DILocation(line: 96, column: 9, scope: !141)
!149 = !DILocation(line: 97, column: 9, scope: !141)
!150 = !DILocation(line: 97, column: 21, scope: !141)
!151 = !DILocation(line: 98, column: 20, scope: !141)
!152 = !DILocation(line: 98, column: 9, scope: !141)
!153 = !DILocation(line: 99, column: 14, scope: !141)
!154 = !DILocation(line: 99, column: 9, scope: !141)
!155 = !DILocation(line: 101, column: 1, scope: !120)
