; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %2, 0, !dbg !36
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !38

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #8, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end3, !dbg !44

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !50
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !51
  %6 = bitcast i32* %arraydecay to i8*, !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %8 = bitcast i32* %7 to i8*, !dbg !51
  %9 = load i32*, i32** %data, align 8, !dbg !53
  %call4 = call i64 @wcslen(i32* %9) #10, !dbg !54
  %mul = mul i64 %call4, 4, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !51
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !56
  store i32 0, i32* %arrayidx5, align 4, !dbg !57
  %10 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* %10), !dbg !59
  %11 = load i32*, i32** %data, align 8, !dbg !60
  %12 = bitcast i32* %11 to i8*, !dbg !60
  call void @free(i8* %12) #8, !dbg !61
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05_good() #0 !dbg !63 {
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
  %call = call i64 @time(i64* null) #8, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #8, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #7

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !90
  %0 = bitcast i8* %call to i32*, !dbg !91
  store i32* %0, i32** %data, align 8, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %cmp = icmp eq i32* %1, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFalse, align 4, !dbg !99
  %tobool = icmp ne i32 %2, 0, !dbg !99
  br i1 %tobool, label %if.then1, label %if.else, !dbg !101

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  br label %if.end3, !dbg !104

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !105
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #8, !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !113
  %6 = bitcast i32* %arraydecay to i8*, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %8 = bitcast i32* %7 to i8*, !dbg !113
  %9 = load i32*, i32** %data, align 8, !dbg !115
  %call4 = call i64 @wcslen(i32* %9) #10, !dbg !116
  %mul = mul i64 %call4, 4, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !113
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !118
  store i32 0, i32* %arrayidx5, align 4, !dbg !119
  %10 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %10), !dbg !121
  %11 = load i32*, i32** %data, align 8, !dbg !122
  %12 = bitcast i32* %11 to i8*, !dbg !122
  call void @free(i8* %12) #8, !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !126, metadata !DIExpression()), !dbg !127
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !128
  %0 = bitcast i8* %call to i32*, !dbg !129
  store i32* %0, i32** %data, align 8, !dbg !130
  %1 = load i32*, i32** %data, align 8, !dbg !131
  %cmp = icmp eq i32* %1, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticTrue, align 4, !dbg !137
  %tobool = icmp ne i32 %2, 0, !dbg !137
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !139

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !140
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #8, !dbg !142
  %4 = load i32*, i32** %data, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !144
  br label %if.end3, !dbg !145

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !146, metadata !DIExpression()), !dbg !148
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !148
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !149
  %6 = bitcast i32* %arraydecay to i8*, !dbg !149
  %7 = load i32*, i32** %data, align 8, !dbg !150
  %8 = bitcast i32* %7 to i8*, !dbg !149
  %9 = load i32*, i32** %data, align 8, !dbg !151
  %call4 = call i64 @wcslen(i32* %9) #10, !dbg !152
  %mul = mul i64 %call4, 4, !dbg !153
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !149
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !154
  store i32 0, i32* %arrayidx5, align 4, !dbg !155
  %10 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %10), !dbg !157
  %11 = load i32*, i32** %data, align 8, !dbg !158
  %12 = bitcast i32* %11 to i8*, !dbg !158
  call void @free(i8* %12) #8, !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05.c", directory: "/root/SSE-Assessment")
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
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05.c", directory: "/root/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!51 = !DILocation(line: 44, column: 9, scope: !46)
!52 = !DILocation(line: 44, column: 22, scope: !46)
!53 = !DILocation(line: 44, column: 35, scope: !46)
!54 = !DILocation(line: 44, column: 28, scope: !46)
!55 = !DILocation(line: 44, column: 40, scope: !46)
!56 = !DILocation(line: 45, column: 9, scope: !46)
!57 = !DILocation(line: 45, column: 20, scope: !46)
!58 = !DILocation(line: 46, column: 20, scope: !46)
!59 = !DILocation(line: 46, column: 9, scope: !46)
!60 = !DILocation(line: 47, column: 14, scope: !46)
!61 = !DILocation(line: 47, column: 9, scope: !46)
!62 = !DILocation(line: 49, column: 1, scope: !22)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_05_good", scope: !15, file: !15, line: 104, type: !23, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 106, column: 5, scope: !63)
!65 = !DILocation(line: 107, column: 5, scope: !63)
!66 = !DILocation(line: 108, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 120, type: !68, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!9, !9, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 120, type: !9)
!74 = !DILocation(line: 120, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 120, type: !70)
!76 = !DILocation(line: 120, column: 27, scope: !67)
!77 = !DILocation(line: 123, column: 22, scope: !67)
!78 = !DILocation(line: 123, column: 12, scope: !67)
!79 = !DILocation(line: 123, column: 5, scope: !67)
!80 = !DILocation(line: 125, column: 5, scope: !67)
!81 = !DILocation(line: 126, column: 5, scope: !67)
!82 = !DILocation(line: 127, column: 5, scope: !67)
!83 = !DILocation(line: 130, column: 5, scope: !67)
!84 = !DILocation(line: 131, column: 5, scope: !67)
!85 = !DILocation(line: 132, column: 5, scope: !67)
!86 = !DILocation(line: 134, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 56, type: !23, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 58, type: !6)
!89 = !DILocation(line: 58, column: 15, scope: !87)
!90 = !DILocation(line: 59, column: 23, scope: !87)
!91 = !DILocation(line: 59, column: 12, scope: !87)
!92 = !DILocation(line: 59, column: 10, scope: !87)
!93 = !DILocation(line: 60, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !15, line: 60, column: 9)
!95 = !DILocation(line: 60, column: 14, scope: !94)
!96 = !DILocation(line: 60, column: 9, scope: !87)
!97 = !DILocation(line: 60, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 60, column: 23)
!99 = !DILocation(line: 61, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !87, file: !15, line: 61, column: 8)
!101 = !DILocation(line: 61, column: 8, scope: !87)
!102 = !DILocation(line: 64, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !15, line: 62, column: 5)
!104 = !DILocation(line: 65, column: 5, scope: !103)
!105 = !DILocation(line: 69, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !100, file: !15, line: 67, column: 5)
!107 = !DILocation(line: 69, column: 9, scope: !106)
!108 = !DILocation(line: 70, column: 9, scope: !106)
!109 = !DILocation(line: 70, column: 20, scope: !106)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !15, line: 73, type: !47)
!111 = distinct !DILexicalBlock(scope: !87, file: !15, line: 72, column: 5)
!112 = !DILocation(line: 73, column: 17, scope: !111)
!113 = !DILocation(line: 75, column: 9, scope: !111)
!114 = !DILocation(line: 75, column: 22, scope: !111)
!115 = !DILocation(line: 75, column: 35, scope: !111)
!116 = !DILocation(line: 75, column: 28, scope: !111)
!117 = !DILocation(line: 75, column: 40, scope: !111)
!118 = !DILocation(line: 76, column: 9, scope: !111)
!119 = !DILocation(line: 76, column: 20, scope: !111)
!120 = !DILocation(line: 77, column: 20, scope: !111)
!121 = !DILocation(line: 77, column: 9, scope: !111)
!122 = !DILocation(line: 78, column: 14, scope: !111)
!123 = !DILocation(line: 78, column: 9, scope: !111)
!124 = !DILocation(line: 80, column: 1, scope: !87)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 83, type: !23, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !15, line: 85, type: !6)
!127 = !DILocation(line: 85, column: 15, scope: !125)
!128 = !DILocation(line: 86, column: 23, scope: !125)
!129 = !DILocation(line: 86, column: 12, scope: !125)
!130 = !DILocation(line: 86, column: 10, scope: !125)
!131 = !DILocation(line: 87, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !15, line: 87, column: 9)
!133 = !DILocation(line: 87, column: 14, scope: !132)
!134 = !DILocation(line: 87, column: 9, scope: !125)
!135 = !DILocation(line: 87, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 87, column: 23)
!137 = !DILocation(line: 88, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !125, file: !15, line: 88, column: 8)
!139 = !DILocation(line: 88, column: 8, scope: !125)
!140 = !DILocation(line: 91, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !15, line: 89, column: 5)
!142 = !DILocation(line: 91, column: 9, scope: !141)
!143 = !DILocation(line: 92, column: 9, scope: !141)
!144 = !DILocation(line: 92, column: 20, scope: !141)
!145 = !DILocation(line: 93, column: 5, scope: !141)
!146 = !DILocalVariable(name: "dest", scope: !147, file: !15, line: 95, type: !47)
!147 = distinct !DILexicalBlock(scope: !125, file: !15, line: 94, column: 5)
!148 = !DILocation(line: 95, column: 17, scope: !147)
!149 = !DILocation(line: 97, column: 9, scope: !147)
!150 = !DILocation(line: 97, column: 22, scope: !147)
!151 = !DILocation(line: 97, column: 35, scope: !147)
!152 = !DILocation(line: 97, column: 28, scope: !147)
!153 = !DILocation(line: 97, column: 40, scope: !147)
!154 = !DILocation(line: 98, column: 9, scope: !147)
!155 = !DILocation(line: 98, column: 20, scope: !147)
!156 = !DILocation(line: 99, column: 20, scope: !147)
!157 = !DILocation(line: 99, column: 9, scope: !147)
!158 = !DILocation(line: 100, column: 14, scope: !147)
!159 = !DILocation(line: 100, column: 9, scope: !147)
!160 = !DILocation(line: 102, column: 1, scope: !125)
