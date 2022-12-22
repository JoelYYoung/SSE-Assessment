; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  store i32 1, i32* @badStatic, align 4, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %call1 = call i32* @badSource(i32* %2), !dbg !40
  store i32* %call1, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %4 = bitcast i32* %arraydecay to i8*, !dbg !48
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %6 = bitcast i32* %5 to i8*, !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !50
  %call2 = call i64 @wcslen(i32* %7) #10, !dbg !51
  %mul = mul i64 %call2, 4, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !48
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %8), !dbg !56
  %9 = load i32*, i32** %data, align 8, !dbg !57
  %10 = bitcast i32* %9 to i8*, !dbg !57
  call void @free(i8* %10) #8, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i32, i32* @badStatic, align 4, !dbg !65
  %tobool = icmp ne i32 %0, 0, !dbg !65
  br i1 %tobool, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !68
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #8, !dbg !70
  %2 = load i32*, i32** %data.addr, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !71
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  br label %if.end, !dbg !73

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !74
  ret i32* %3, !dbg !75
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #8, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #8, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !103
  %0 = bitcast i8* %call to i32*, !dbg !104
  store i32* %0, i32** %data, align 8, !dbg !105
  %1 = load i32*, i32** %data, align 8, !dbg !106
  %cmp = icmp eq i32* %1, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %entry
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !112
  %2 = load i32*, i32** %data, align 8, !dbg !113
  %call1 = call i32* @goodG2B1Source(i32* %2), !dbg !114
  store i32* %call1, i32** %data, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !118
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !119
  %4 = bitcast i32* %arraydecay to i8*, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %6 = bitcast i32* %5 to i8*, !dbg !119
  %7 = load i32*, i32** %data, align 8, !dbg !121
  %call2 = call i64 @wcslen(i32* %7) #10, !dbg !122
  %mul = mul i64 %call2, 4, !dbg !123
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !119
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %8 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* %8), !dbg !127
  %9 = load i32*, i32** %data, align 8, !dbg !128
  %10 = bitcast i32* %9 to i8*, !dbg !128
  call void @free(i8* %10) #8, !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !131 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !132, metadata !DIExpression()), !dbg !133
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !134
  %tobool = icmp ne i32 %0, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !137
  br label %if.end, !dbg !139

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !140
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #8, !dbg !142
  %2 = load i32*, i32** %data.addr, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !144
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !145
  ret i32* %3, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !148, metadata !DIExpression()), !dbg !149
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !150
  %0 = bitcast i8* %call to i32*, !dbg !151
  store i32* %0, i32** %data, align 8, !dbg !152
  %1 = load i32*, i32** %data, align 8, !dbg !153
  %cmp = icmp eq i32* %1, null, !dbg !155
  br i1 %cmp, label %if.then, label %if.end, !dbg !156

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !157
  unreachable, !dbg !157

if.end:                                           ; preds = %entry
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !159
  %2 = load i32*, i32** %data, align 8, !dbg !160
  %call1 = call i32* @goodG2B2Source(i32* %2), !dbg !161
  store i32* %call1, i32** %data, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !163, metadata !DIExpression()), !dbg !165
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !165
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !166
  %4 = bitcast i32* %arraydecay to i8*, !dbg !166
  %5 = load i32*, i32** %data, align 8, !dbg !167
  %6 = bitcast i32* %5 to i8*, !dbg !166
  %7 = load i32*, i32** %data, align 8, !dbg !168
  %call2 = call i64 @wcslen(i32* %7) #10, !dbg !169
  %mul = mul i64 %call2, 4, !dbg !170
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %4, i8* align 4 %6, i64 %mul, i1 false), !dbg !166
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !171
  store i32 0, i32* %arrayidx, align 4, !dbg !172
  %8 = load i32*, i32** %data, align 8, !dbg !173
  call void @printWLine(i32* %8), !dbg !174
  %9 = load i32*, i32** %data, align 8, !dbg !175
  %10 = bitcast i32* %9 to i8*, !dbg !175
  call void @free(i8* %10) #8, !dbg !176
  ret void, !dbg !177
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !178 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !179, metadata !DIExpression()), !dbg !180
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !181
  %tobool = icmp ne i32 %0, 0, !dbg !181
  br i1 %tobool, label %if.then, label %if.end, !dbg !183

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !184
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #8, !dbg !186
  %2 = load i32*, i32** %data.addr, align 8, !dbg !187
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !187
  store i32 0, i32* %arrayidx, align 4, !dbg !188
  br label %if.end, !dbg !189

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !190
  ret i32* %3, !dbg !191
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
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 59, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21.c", directory: "/root/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 60, type: !9, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21_bad", scope: !15, file: !15, line: 37, type: !25, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 39, type: !6)
!28 = !DILocation(line: 39, column: 15, scope: !24)
!29 = !DILocation(line: 40, column: 23, scope: !24)
!30 = !DILocation(line: 40, column: 12, scope: !24)
!31 = !DILocation(line: 40, column: 10, scope: !24)
!32 = !DILocation(line: 41, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !24, file: !15, line: 41, column: 9)
!34 = !DILocation(line: 41, column: 14, scope: !33)
!35 = !DILocation(line: 41, column: 9, scope: !24)
!36 = !DILocation(line: 41, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 41, column: 23)
!38 = !DILocation(line: 42, column: 15, scope: !24)
!39 = !DILocation(line: 43, column: 22, scope: !24)
!40 = !DILocation(line: 43, column: 12, scope: !24)
!41 = !DILocation(line: 43, column: 10, scope: !24)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !15, line: 45, type: !44)
!43 = distinct !DILexicalBlock(scope: !24, file: !15, line: 44, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 45, column: 17, scope: !43)
!48 = !DILocation(line: 47, column: 9, scope: !43)
!49 = !DILocation(line: 47, column: 23, scope: !43)
!50 = !DILocation(line: 47, column: 36, scope: !43)
!51 = !DILocation(line: 47, column: 29, scope: !43)
!52 = !DILocation(line: 47, column: 41, scope: !43)
!53 = !DILocation(line: 48, column: 9, scope: !43)
!54 = !DILocation(line: 48, column: 20, scope: !43)
!55 = !DILocation(line: 49, column: 20, scope: !43)
!56 = !DILocation(line: 49, column: 9, scope: !43)
!57 = !DILocation(line: 50, column: 14, scope: !43)
!58 = !DILocation(line: 50, column: 9, scope: !43)
!59 = !DILocation(line: 52, column: 1, scope: !24)
!60 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !61, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!6, !6}
!63 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !15, line: 26, type: !6)
!64 = !DILocation(line: 26, column: 38, scope: !60)
!65 = !DILocation(line: 28, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !15, line: 28, column: 8)
!67 = !DILocation(line: 28, column: 8, scope: !60)
!68 = !DILocation(line: 31, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !15, line: 29, column: 5)
!70 = !DILocation(line: 31, column: 9, scope: !69)
!71 = !DILocation(line: 32, column: 9, scope: !69)
!72 = !DILocation(line: 32, column: 21, scope: !69)
!73 = !DILocation(line: 33, column: 5, scope: !69)
!74 = !DILocation(line: 34, column: 12, scope: !60)
!75 = !DILocation(line: 34, column: 5, scope: !60)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_21_good", scope: !15, file: !15, line: 125, type: !25, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 127, column: 5, scope: !76)
!78 = !DILocation(line: 128, column: 5, scope: !76)
!79 = !DILocation(line: 129, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 141, type: !81, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{!9, !9, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 141, type: !9)
!87 = !DILocation(line: 141, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 141, type: !83)
!89 = !DILocation(line: 141, column: 27, scope: !80)
!90 = !DILocation(line: 144, column: 22, scope: !80)
!91 = !DILocation(line: 144, column: 12, scope: !80)
!92 = !DILocation(line: 144, column: 5, scope: !80)
!93 = !DILocation(line: 146, column: 5, scope: !80)
!94 = !DILocation(line: 147, column: 5, scope: !80)
!95 = !DILocation(line: 148, column: 5, scope: !80)
!96 = !DILocation(line: 151, column: 5, scope: !80)
!97 = !DILocation(line: 152, column: 5, scope: !80)
!98 = !DILocation(line: 153, column: 5, scope: !80)
!99 = !DILocation(line: 155, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 79, type: !25, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 81, type: !6)
!102 = !DILocation(line: 81, column: 15, scope: !100)
!103 = !DILocation(line: 82, column: 23, scope: !100)
!104 = !DILocation(line: 82, column: 12, scope: !100)
!105 = !DILocation(line: 82, column: 10, scope: !100)
!106 = !DILocation(line: 83, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !100, file: !15, line: 83, column: 9)
!108 = !DILocation(line: 83, column: 14, scope: !107)
!109 = !DILocation(line: 83, column: 9, scope: !100)
!110 = !DILocation(line: 83, column: 24, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !15, line: 83, column: 23)
!112 = !DILocation(line: 84, column: 20, scope: !100)
!113 = !DILocation(line: 85, column: 27, scope: !100)
!114 = !DILocation(line: 85, column: 12, scope: !100)
!115 = !DILocation(line: 85, column: 10, scope: !100)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !15, line: 87, type: !44)
!117 = distinct !DILexicalBlock(scope: !100, file: !15, line: 86, column: 5)
!118 = !DILocation(line: 87, column: 17, scope: !117)
!119 = !DILocation(line: 89, column: 9, scope: !117)
!120 = !DILocation(line: 89, column: 23, scope: !117)
!121 = !DILocation(line: 89, column: 36, scope: !117)
!122 = !DILocation(line: 89, column: 29, scope: !117)
!123 = !DILocation(line: 89, column: 41, scope: !117)
!124 = !DILocation(line: 90, column: 9, scope: !117)
!125 = !DILocation(line: 90, column: 20, scope: !117)
!126 = !DILocation(line: 91, column: 20, scope: !117)
!127 = !DILocation(line: 91, column: 9, scope: !117)
!128 = !DILocation(line: 92, column: 14, scope: !117)
!129 = !DILocation(line: 92, column: 9, scope: !117)
!130 = !DILocation(line: 94, column: 1, scope: !100)
!131 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 63, type: !61, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocalVariable(name: "data", arg: 1, scope: !131, file: !15, line: 63, type: !6)
!133 = !DILocation(line: 63, column: 43, scope: !131)
!134 = !DILocation(line: 65, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !15, line: 65, column: 8)
!136 = !DILocation(line: 65, column: 8, scope: !131)
!137 = !DILocation(line: 68, column: 9, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !15, line: 66, column: 5)
!139 = !DILocation(line: 69, column: 5, scope: !138)
!140 = !DILocation(line: 73, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !15, line: 71, column: 5)
!142 = !DILocation(line: 73, column: 9, scope: !141)
!143 = !DILocation(line: 74, column: 9, scope: !141)
!144 = !DILocation(line: 74, column: 20, scope: !141)
!145 = !DILocation(line: 76, column: 12, scope: !131)
!146 = !DILocation(line: 76, column: 5, scope: !131)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 108, type: !25, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", scope: !147, file: !15, line: 110, type: !6)
!149 = !DILocation(line: 110, column: 15, scope: !147)
!150 = !DILocation(line: 111, column: 23, scope: !147)
!151 = !DILocation(line: 111, column: 12, scope: !147)
!152 = !DILocation(line: 111, column: 10, scope: !147)
!153 = !DILocation(line: 112, column: 9, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !15, line: 112, column: 9)
!155 = !DILocation(line: 112, column: 14, scope: !154)
!156 = !DILocation(line: 112, column: 9, scope: !147)
!157 = !DILocation(line: 112, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 112, column: 23)
!159 = !DILocation(line: 113, column: 20, scope: !147)
!160 = !DILocation(line: 114, column: 27, scope: !147)
!161 = !DILocation(line: 114, column: 12, scope: !147)
!162 = !DILocation(line: 114, column: 10, scope: !147)
!163 = !DILocalVariable(name: "dest", scope: !164, file: !15, line: 116, type: !44)
!164 = distinct !DILexicalBlock(scope: !147, file: !15, line: 115, column: 5)
!165 = !DILocation(line: 116, column: 17, scope: !164)
!166 = !DILocation(line: 118, column: 9, scope: !164)
!167 = !DILocation(line: 118, column: 23, scope: !164)
!168 = !DILocation(line: 118, column: 36, scope: !164)
!169 = !DILocation(line: 118, column: 29, scope: !164)
!170 = !DILocation(line: 118, column: 41, scope: !164)
!171 = !DILocation(line: 119, column: 9, scope: !164)
!172 = !DILocation(line: 119, column: 20, scope: !164)
!173 = !DILocation(line: 120, column: 20, scope: !164)
!174 = !DILocation(line: 120, column: 9, scope: !164)
!175 = !DILocation(line: 121, column: 14, scope: !164)
!176 = !DILocation(line: 121, column: 9, scope: !164)
!177 = !DILocation(line: 123, column: 1, scope: !147)
!178 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 97, type: !61, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!179 = !DILocalVariable(name: "data", arg: 1, scope: !178, file: !15, line: 97, type: !6)
!180 = !DILocation(line: 97, column: 43, scope: !178)
!181 = !DILocation(line: 99, column: 8, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 99, column: 8)
!183 = !DILocation(line: 99, column: 8, scope: !178)
!184 = !DILocation(line: 102, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !15, line: 100, column: 5)
!186 = !DILocation(line: 102, column: 9, scope: !185)
!187 = !DILocation(line: 103, column: 9, scope: !185)
!188 = !DILocation(line: 103, column: 20, scope: !185)
!189 = !DILocation(line: 104, column: 5, scope: !185)
!190 = !DILocation(line: 105, column: 12, scope: !178)
!191 = !DILocation(line: 105, column: 5, scope: !178)
