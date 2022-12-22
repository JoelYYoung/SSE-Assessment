; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %2 = bitcast i32* %1 to i8*, !dbg !45
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !46
  store i32 0, i32* %arrayidx3, align 4, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %5), !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  %7 = bitcast i32* %6 to i8*, !dbg !50
  call void @free(i8* %7) #6, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* @badStatic, align 4, !dbg !58
  %tobool = icmp ne i32 %0, 0, !dbg !58
  br i1 %tobool, label %if.then, label %if.end2, !dbg !60

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !61
  %1 = bitcast i8* %call to i32*, !dbg !63
  store i32* %1, i32** %data.addr, align 8, !dbg !64
  %2 = load i32*, i32** %data.addr, align 8, !dbg !65
  %cmp = icmp eq i32* %2, null, !dbg !67
  br i1 %cmp, label %if.then1, label %if.end, !dbg !68

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !71
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  br label %if.end2, !dbg !73

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !74
  ret i32* %4, !dbg !75
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21_good() #0 !dbg !76 {
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
  %call = call i64 @time(i64* null) #6, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #6, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i32* null, i32** %data, align 8, !dbg !103
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !104
  %0 = load i32*, i32** %data, align 8, !dbg !105
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !106
  store i32* %call, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !112
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %1 = load i32*, i32** %data, align 8, !dbg !115
  %2 = bitcast i32* %1 to i8*, !dbg !116
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !116
  %4 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !117
  store i32 0, i32* %arrayidx3, align 4, !dbg !118
  %5 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* %5), !dbg !120
  %6 = load i32*, i32** %data, align 8, !dbg !121
  %7 = bitcast i32* %6 to i8*, !dbg !121
  call void @free(i8* %7) #6, !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !124 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !127
  %tobool = icmp ne i32 %0, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.else, !dbg !129

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !130
  br label %if.end2, !dbg !132

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !133
  %1 = bitcast i8* %call to i32*, !dbg !135
  store i32* %1, i32** %data.addr, align 8, !dbg !136
  %2 = load i32*, i32** %data.addr, align 8, !dbg !137
  %cmp = icmp eq i32* %2, null, !dbg !139
  br i1 %cmp, label %if.then1, label %if.end, !dbg !140

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !141
  unreachable, !dbg !141

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data.addr, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !144
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i32*, i32** %data.addr, align 8, !dbg !145
  ret i32* %4, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !148, metadata !DIExpression()), !dbg !149
  store i32* null, i32** %data, align 8, !dbg !150
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !151
  %0 = load i32*, i32** %data, align 8, !dbg !152
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !153
  store i32* %call, i32** %data, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !155, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !158
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !159
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !161
  %1 = load i32*, i32** %data, align 8, !dbg !162
  %2 = bitcast i32* %1 to i8*, !dbg !163
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !163
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !163
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !163
  %4 = load i32*, i32** %data, align 8, !dbg !164
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !164
  store i32 0, i32* %arrayidx3, align 4, !dbg !165
  %5 = load i32*, i32** %data, align 8, !dbg !166
  call void @printWLine(i32* %5), !dbg !167
  %6 = load i32*, i32** %data, align 8, !dbg !168
  %7 = bitcast i32* %6 to i8*, !dbg !168
  call void @free(i8* %7) #6, !dbg !169
  ret void, !dbg !170
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !171 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !172, metadata !DIExpression()), !dbg !173
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !174
  %tobool = icmp ne i32 %0, 0, !dbg !174
  br i1 %tobool, label %if.then, label %if.end2, !dbg !176

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !177
  %1 = bitcast i8* %call to i32*, !dbg !179
  store i32* %1, i32** %data.addr, align 8, !dbg !180
  %2 = load i32*, i32** %data.addr, align 8, !dbg !181
  %cmp = icmp eq i32* %2, null, !dbg !183
  br i1 %cmp, label %if.then1, label %if.end, !dbg !184

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !185
  unreachable, !dbg !185

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !187
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !187
  store i32 0, i32* %arrayidx, align 4, !dbg !188
  br label %if.end2, !dbg !189

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i32*, i32** %data.addr, align 8, !dbg !190
  ret i32* %4, !dbg !191
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 61, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21.c", directory: "/root/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 62, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21_bad", scope: !15, file: !15, line: 38, type: !25, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 40, type: !7)
!28 = !DILocation(line: 40, column: 15, scope: !24)
!29 = !DILocation(line: 41, column: 10, scope: !24)
!30 = !DILocation(line: 42, column: 15, scope: !24)
!31 = !DILocation(line: 43, column: 22, scope: !24)
!32 = !DILocation(line: 43, column: 12, scope: !24)
!33 = !DILocation(line: 43, column: 10, scope: !24)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 45, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 44, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 45, column: 17, scope: !35)
!40 = !DILocation(line: 46, column: 17, scope: !35)
!41 = !DILocation(line: 46, column: 9, scope: !35)
!42 = !DILocation(line: 47, column: 9, scope: !35)
!43 = !DILocation(line: 47, column: 23, scope: !35)
!44 = !DILocation(line: 49, column: 16, scope: !35)
!45 = !DILocation(line: 49, column: 9, scope: !35)
!46 = !DILocation(line: 50, column: 9, scope: !35)
!47 = !DILocation(line: 50, column: 21, scope: !35)
!48 = !DILocation(line: 51, column: 20, scope: !35)
!49 = !DILocation(line: 51, column: 9, scope: !35)
!50 = !DILocation(line: 52, column: 14, scope: !35)
!51 = !DILocation(line: 52, column: 9, scope: !35)
!52 = !DILocation(line: 54, column: 1, scope: !24)
!53 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !54, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!7, !7}
!56 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !15, line: 26, type: !7)
!57 = !DILocation(line: 26, column: 38, scope: !53)
!58 = !DILocation(line: 28, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !15, line: 28, column: 8)
!60 = !DILocation(line: 28, column: 8, scope: !53)
!61 = !DILocation(line: 31, column: 27, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !15, line: 29, column: 5)
!63 = !DILocation(line: 31, column: 16, scope: !62)
!64 = !DILocation(line: 31, column: 14, scope: !62)
!65 = !DILocation(line: 32, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 32, column: 13)
!67 = !DILocation(line: 32, column: 18, scope: !66)
!68 = !DILocation(line: 32, column: 13, scope: !62)
!69 = !DILocation(line: 32, column: 28, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 32, column: 27)
!71 = !DILocation(line: 33, column: 9, scope: !62)
!72 = !DILocation(line: 33, column: 17, scope: !62)
!73 = !DILocation(line: 34, column: 5, scope: !62)
!74 = !DILocation(line: 35, column: 12, scope: !53)
!75 = !DILocation(line: 35, column: 5, scope: !53)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_21_good", scope: !15, file: !15, line: 131, type: !25, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 133, column: 5, scope: !76)
!78 = !DILocation(line: 134, column: 5, scope: !76)
!79 = !DILocation(line: 135, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 147, type: !81, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{!10, !10, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 147, type: !10)
!87 = !DILocation(line: 147, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 147, type: !83)
!89 = !DILocation(line: 147, column: 27, scope: !80)
!90 = !DILocation(line: 150, column: 22, scope: !80)
!91 = !DILocation(line: 150, column: 12, scope: !80)
!92 = !DILocation(line: 150, column: 5, scope: !80)
!93 = !DILocation(line: 152, column: 5, scope: !80)
!94 = !DILocation(line: 153, column: 5, scope: !80)
!95 = !DILocation(line: 154, column: 5, scope: !80)
!96 = !DILocation(line: 157, column: 5, scope: !80)
!97 = !DILocation(line: 158, column: 5, scope: !80)
!98 = !DILocation(line: 159, column: 5, scope: !80)
!99 = !DILocation(line: 161, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 82, type: !25, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 84, type: !7)
!102 = !DILocation(line: 84, column: 15, scope: !100)
!103 = !DILocation(line: 85, column: 10, scope: !100)
!104 = !DILocation(line: 86, column: 20, scope: !100)
!105 = !DILocation(line: 87, column: 27, scope: !100)
!106 = !DILocation(line: 87, column: 12, scope: !100)
!107 = !DILocation(line: 87, column: 10, scope: !100)
!108 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 89, type: !36)
!109 = distinct !DILexicalBlock(scope: !100, file: !15, line: 88, column: 5)
!110 = !DILocation(line: 89, column: 17, scope: !109)
!111 = !DILocation(line: 90, column: 17, scope: !109)
!112 = !DILocation(line: 90, column: 9, scope: !109)
!113 = !DILocation(line: 91, column: 9, scope: !109)
!114 = !DILocation(line: 91, column: 23, scope: !109)
!115 = !DILocation(line: 93, column: 16, scope: !109)
!116 = !DILocation(line: 93, column: 9, scope: !109)
!117 = !DILocation(line: 94, column: 9, scope: !109)
!118 = !DILocation(line: 94, column: 21, scope: !109)
!119 = !DILocation(line: 95, column: 20, scope: !109)
!120 = !DILocation(line: 95, column: 9, scope: !109)
!121 = !DILocation(line: 96, column: 14, scope: !109)
!122 = !DILocation(line: 96, column: 9, scope: !109)
!123 = !DILocation(line: 98, column: 1, scope: !100)
!124 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 65, type: !54, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", arg: 1, scope: !124, file: !15, line: 65, type: !7)
!126 = !DILocation(line: 65, column: 43, scope: !124)
!127 = !DILocation(line: 67, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 67, column: 8)
!129 = !DILocation(line: 67, column: 8, scope: !124)
!130 = !DILocation(line: 70, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !15, line: 68, column: 5)
!132 = !DILocation(line: 71, column: 5, scope: !131)
!133 = !DILocation(line: 75, column: 27, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !15, line: 73, column: 5)
!135 = !DILocation(line: 75, column: 16, scope: !134)
!136 = !DILocation(line: 75, column: 14, scope: !134)
!137 = !DILocation(line: 76, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !15, line: 76, column: 13)
!139 = !DILocation(line: 76, column: 18, scope: !138)
!140 = !DILocation(line: 76, column: 13, scope: !134)
!141 = !DILocation(line: 76, column: 28, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !15, line: 76, column: 27)
!143 = !DILocation(line: 77, column: 9, scope: !134)
!144 = !DILocation(line: 77, column: 17, scope: !134)
!145 = !DILocation(line: 79, column: 12, scope: !124)
!146 = !DILocation(line: 79, column: 5, scope: !124)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 113, type: !25, scopeLine: 114, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", scope: !147, file: !15, line: 115, type: !7)
!149 = !DILocation(line: 115, column: 15, scope: !147)
!150 = !DILocation(line: 116, column: 10, scope: !147)
!151 = !DILocation(line: 117, column: 20, scope: !147)
!152 = !DILocation(line: 118, column: 27, scope: !147)
!153 = !DILocation(line: 118, column: 12, scope: !147)
!154 = !DILocation(line: 118, column: 10, scope: !147)
!155 = !DILocalVariable(name: "source", scope: !156, file: !15, line: 120, type: !36)
!156 = distinct !DILexicalBlock(scope: !147, file: !15, line: 119, column: 5)
!157 = !DILocation(line: 120, column: 17, scope: !156)
!158 = !DILocation(line: 121, column: 17, scope: !156)
!159 = !DILocation(line: 121, column: 9, scope: !156)
!160 = !DILocation(line: 122, column: 9, scope: !156)
!161 = !DILocation(line: 122, column: 23, scope: !156)
!162 = !DILocation(line: 124, column: 16, scope: !156)
!163 = !DILocation(line: 124, column: 9, scope: !156)
!164 = !DILocation(line: 125, column: 9, scope: !156)
!165 = !DILocation(line: 125, column: 21, scope: !156)
!166 = !DILocation(line: 126, column: 20, scope: !156)
!167 = !DILocation(line: 126, column: 9, scope: !156)
!168 = !DILocation(line: 127, column: 14, scope: !156)
!169 = !DILocation(line: 127, column: 9, scope: !156)
!170 = !DILocation(line: 129, column: 1, scope: !147)
!171 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 101, type: !54, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!172 = !DILocalVariable(name: "data", arg: 1, scope: !171, file: !15, line: 101, type: !7)
!173 = !DILocation(line: 101, column: 43, scope: !171)
!174 = !DILocation(line: 103, column: 8, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !15, line: 103, column: 8)
!176 = !DILocation(line: 103, column: 8, scope: !171)
!177 = !DILocation(line: 106, column: 27, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !15, line: 104, column: 5)
!179 = !DILocation(line: 106, column: 16, scope: !178)
!180 = !DILocation(line: 106, column: 14, scope: !178)
!181 = !DILocation(line: 107, column: 13, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 107, column: 13)
!183 = !DILocation(line: 107, column: 18, scope: !182)
!184 = !DILocation(line: 107, column: 13, scope: !178)
!185 = !DILocation(line: 107, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !15, line: 107, column: 27)
!187 = !DILocation(line: 108, column: 9, scope: !178)
!188 = !DILocation(line: 108, column: 17, scope: !178)
!189 = !DILocation(line: 109, column: 5, scope: !178)
!190 = !DILocation(line: 110, column: 12, scope: !171)
!191 = !DILocation(line: 110, column: 5, scope: !171)
