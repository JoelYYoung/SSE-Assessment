; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !31
  %tobool = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool, label %if.then2, label %if.else, !dbg !33

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end6, !dbg !39

if.else:                                          ; preds = %if.end
  %4 = load i32*, i32** %data, align 8, !dbg !40
  %call4 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 49, !dbg !43
  store i32 0, i32* %arrayidx5, align 4, !dbg !44
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !45, metadata !DIExpression()), !dbg !50
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !55, metadata !DIExpression()), !dbg !56
  %7 = load i32*, i32** %data, align 8, !dbg !57
  %call7 = call i64 @wcslen(i32* %7) #9, !dbg !58
  store i64 %call7, i64* %dataLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end6
  %8 = load i64, i64* %i, align 8, !dbg !63
  %9 = load i64, i64* %dataLen, align 8, !dbg !65
  %cmp8 = icmp ult i64 %8, %9, !dbg !66
  br i1 %cmp8, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !68
  %11 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !68
  %12 = load i32, i32* %arrayidx9, align 4, !dbg !68
  %13 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx10 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !72
  store i32 %12, i32* %arrayidx10, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %14, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !80
  store i32 0, i32* %arrayidx11, align 4, !dbg !81
  %15 = load i32*, i32** %data, align 8, !dbg !82
  call void @printWLine(i32* %15), !dbg !83
  %16 = load i32*, i32** %data, align 8, !dbg !84
  %17 = bitcast i32* %16 to i8*, !dbg !84
  call void @free(i8* %17) #7, !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @globalReturnsTrueOrFalse(...) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #7, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #7, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !113
  %0 = bitcast i8* %call to i32*, !dbg !114
  store i32* %0, i32** %data, align 8, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %cmp = icmp eq i32* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !122
  %tobool = icmp ne i32 %call1, 0, !dbg !122
  br i1 %tobool, label %if.then2, label %if.else, !dbg !124

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !125
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !127
  %3 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %if.end6, !dbg !130

if.else:                                          ; preds = %if.end
  %4 = load i32*, i32** %data, align 8, !dbg !131
  %call4 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !133
  %5 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 49, !dbg !134
  store i32 0, i32* %arrayidx5, align 4, !dbg !135
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !141, metadata !DIExpression()), !dbg !142
  %7 = load i32*, i32** %data, align 8, !dbg !143
  %call7 = call i64 @wcslen(i32* %7) #9, !dbg !144
  store i64 %call7, i64* %dataLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end6
  %8 = load i64, i64* %i, align 8, !dbg !149
  %9 = load i64, i64* %dataLen, align 8, !dbg !151
  %cmp8 = icmp ult i64 %8, %9, !dbg !152
  br i1 %cmp8, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !154
  %11 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !154
  %12 = load i32, i32* %arrayidx9, align 4, !dbg !154
  %13 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx10 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !158
  store i32 %12, i32* %arrayidx10, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %14, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !165
  store i32 0, i32* %arrayidx11, align 4, !dbg !166
  %15 = load i32*, i32** %data, align 8, !dbg !167
  call void @printWLine(i32* %15), !dbg !168
  %16 = load i32*, i32** %data, align 8, !dbg !169
  %17 = bitcast i32* %16 to i8*, !dbg !169
  call void @free(i8* %17) #7, !dbg !170
  ret void, !dbg !171
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12.c", directory: "/root/SSE-Assessment")
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
!40 = !DILocation(line: 37, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !17, line: 35, column: 5)
!42 = !DILocation(line: 37, column: 9, scope: !41)
!43 = !DILocation(line: 38, column: 9, scope: !41)
!44 = !DILocation(line: 38, column: 20, scope: !41)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !17, line: 41, type: !47)
!46 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 50)
!50 = !DILocation(line: 41, column: 17, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !46, file: !17, line: 42, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !53)
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 42, column: 16, scope: !46)
!55 = !DILocalVariable(name: "dataLen", scope: !46, file: !17, line: 42, type: !52)
!56 = !DILocation(line: 42, column: 19, scope: !46)
!57 = !DILocation(line: 43, column: 26, scope: !46)
!58 = !DILocation(line: 43, column: 19, scope: !46)
!59 = !DILocation(line: 43, column: 17, scope: !46)
!60 = !DILocation(line: 45, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !46, file: !17, line: 45, column: 9)
!62 = !DILocation(line: 45, column: 14, scope: !61)
!63 = !DILocation(line: 45, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !17, line: 45, column: 9)
!65 = !DILocation(line: 45, column: 25, scope: !64)
!66 = !DILocation(line: 45, column: 23, scope: !64)
!67 = !DILocation(line: 45, column: 9, scope: !61)
!68 = !DILocation(line: 47, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !17, line: 46, column: 9)
!70 = !DILocation(line: 47, column: 28, scope: !69)
!71 = !DILocation(line: 47, column: 18, scope: !69)
!72 = !DILocation(line: 47, column: 13, scope: !69)
!73 = !DILocation(line: 47, column: 21, scope: !69)
!74 = !DILocation(line: 48, column: 9, scope: !69)
!75 = !DILocation(line: 45, column: 35, scope: !64)
!76 = !DILocation(line: 45, column: 9, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 48, column: 9, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 49, column: 9, scope: !46)
!81 = !DILocation(line: 49, column: 20, scope: !46)
!82 = !DILocation(line: 50, column: 20, scope: !46)
!83 = !DILocation(line: 50, column: 9, scope: !46)
!84 = !DILocation(line: 51, column: 14, scope: !46)
!85 = !DILocation(line: 51, column: 9, scope: !46)
!86 = !DILocation(line: 53, column: 1, scope: !16)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_12_good", scope: !17, file: !17, line: 93, type: !18, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 95, column: 5, scope: !87)
!89 = !DILocation(line: 96, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 108, type: !91, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!7, !7, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !17, line: 108, type: !7)
!97 = !DILocation(line: 108, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !17, line: 108, type: !93)
!99 = !DILocation(line: 108, column: 27, scope: !90)
!100 = !DILocation(line: 111, column: 22, scope: !90)
!101 = !DILocation(line: 111, column: 12, scope: !90)
!102 = !DILocation(line: 111, column: 5, scope: !90)
!103 = !DILocation(line: 113, column: 5, scope: !90)
!104 = !DILocation(line: 114, column: 5, scope: !90)
!105 = !DILocation(line: 115, column: 5, scope: !90)
!106 = !DILocation(line: 118, column: 5, scope: !90)
!107 = !DILocation(line: 119, column: 5, scope: !90)
!108 = !DILocation(line: 120, column: 5, scope: !90)
!109 = !DILocation(line: 122, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !17, line: 63, type: !4)
!112 = !DILocation(line: 63, column: 15, scope: !110)
!113 = !DILocation(line: 64, column: 23, scope: !110)
!114 = !DILocation(line: 64, column: 12, scope: !110)
!115 = !DILocation(line: 64, column: 10, scope: !110)
!116 = !DILocation(line: 65, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !17, line: 65, column: 9)
!118 = !DILocation(line: 65, column: 14, scope: !117)
!119 = !DILocation(line: 65, column: 9, scope: !110)
!120 = !DILocation(line: 65, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 65, column: 23)
!122 = !DILocation(line: 66, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !110, file: !17, line: 66, column: 8)
!124 = !DILocation(line: 66, column: 8, scope: !110)
!125 = !DILocation(line: 69, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !17, line: 67, column: 5)
!127 = !DILocation(line: 69, column: 9, scope: !126)
!128 = !DILocation(line: 70, column: 9, scope: !126)
!129 = !DILocation(line: 70, column: 20, scope: !126)
!130 = !DILocation(line: 71, column: 5, scope: !126)
!131 = !DILocation(line: 75, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !17, line: 73, column: 5)
!133 = !DILocation(line: 75, column: 9, scope: !132)
!134 = !DILocation(line: 76, column: 9, scope: !132)
!135 = !DILocation(line: 76, column: 20, scope: !132)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !17, line: 79, type: !47)
!137 = distinct !DILexicalBlock(scope: !110, file: !17, line: 78, column: 5)
!138 = !DILocation(line: 79, column: 17, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !137, file: !17, line: 80, type: !52)
!140 = !DILocation(line: 80, column: 16, scope: !137)
!141 = !DILocalVariable(name: "dataLen", scope: !137, file: !17, line: 80, type: !52)
!142 = !DILocation(line: 80, column: 19, scope: !137)
!143 = !DILocation(line: 81, column: 26, scope: !137)
!144 = !DILocation(line: 81, column: 19, scope: !137)
!145 = !DILocation(line: 81, column: 17, scope: !137)
!146 = !DILocation(line: 83, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !137, file: !17, line: 83, column: 9)
!148 = !DILocation(line: 83, column: 14, scope: !147)
!149 = !DILocation(line: 83, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !17, line: 83, column: 9)
!151 = !DILocation(line: 83, column: 25, scope: !150)
!152 = !DILocation(line: 83, column: 23, scope: !150)
!153 = !DILocation(line: 83, column: 9, scope: !147)
!154 = !DILocation(line: 85, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !17, line: 84, column: 9)
!156 = !DILocation(line: 85, column: 28, scope: !155)
!157 = !DILocation(line: 85, column: 18, scope: !155)
!158 = !DILocation(line: 85, column: 13, scope: !155)
!159 = !DILocation(line: 85, column: 21, scope: !155)
!160 = !DILocation(line: 86, column: 9, scope: !155)
!161 = !DILocation(line: 83, column: 35, scope: !150)
!162 = !DILocation(line: 83, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !79}
!164 = !DILocation(line: 86, column: 9, scope: !147)
!165 = !DILocation(line: 87, column: 9, scope: !137)
!166 = !DILocation(line: 87, column: 20, scope: !137)
!167 = !DILocation(line: 88, column: 20, scope: !137)
!168 = !DILocation(line: 88, column: 9, scope: !137)
!169 = !DILocation(line: 89, column: 14, scope: !137)
!170 = !DILocation(line: 89, column: 9, scope: !137)
!171 = !DILocation(line: 91, column: 1, scope: !110)
