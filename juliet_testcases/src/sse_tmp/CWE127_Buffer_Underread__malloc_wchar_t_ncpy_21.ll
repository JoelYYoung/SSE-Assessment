; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21.c"
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  %call4 = call i64 @wcslen(i32* %arraydecay3) #7, !dbg !47
  %call5 = call i32* @wcsncpy(i32* %arraydecay2, i32* %1, i64 %call4) #6, !dbg !48
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx6, align 4, !dbg !50
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  call void @printWLine(i32* %arraydecay7), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @badStatic, align 4, !dbg !59
  %tobool = icmp ne i32 %0, 0, !dbg !59
  br i1 %tobool, label %if.then, label %if.end3, !dbg !61

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !62, metadata !DIExpression()), !dbg !65
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !66
  %1 = bitcast i8* %call to i32*, !dbg !67
  store i32* %1, i32** %dataBuffer, align 8, !dbg !65
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !68
  %cmp = icmp eq i32* %2, null, !dbg !70
  br i1 %cmp, label %if.then1, label %if.end, !dbg !71

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !75
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !79
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !80
  br label %if.end3, !dbg !81

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !82
  ret i32* %6, !dbg !83
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21_good() #0 !dbg !84 {
entry:
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #6, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #6, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
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
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32* null, i32** %data, align 8, !dbg !111
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !112
  %0 = load i32*, i32** %data, align 8, !dbg !113
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !114
  store i32* %call, i32** %data, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !120
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %1 = load i32*, i32** %data, align 8, !dbg !124
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call4 = call i64 @wcslen(i32* %arraydecay3) #7, !dbg !126
  %call5 = call i32* @wcsncpy(i32* %arraydecay2, i32* %1, i64 %call4) #6, !dbg !127
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx6, align 4, !dbg !129
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay7), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !133 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !134, metadata !DIExpression()), !dbg !135
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !136
  %tobool = icmp ne i32 %0, 0, !dbg !136
  br i1 %tobool, label %if.then, label %if.else, !dbg !138

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !139
  br label %if.end3, !dbg !141

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !142, metadata !DIExpression()), !dbg !145
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !146
  %1 = bitcast i8* %call to i32*, !dbg !147
  store i32* %1, i32** %dataBuffer, align 8, !dbg !145
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  %cmp = icmp eq i32* %2, null, !dbg !150
  br i1 %cmp, label %if.then1, label %if.end, !dbg !151

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !152
  unreachable, !dbg !152

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !155
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !156
  store i32 0, i32* %arrayidx, align 4, !dbg !157
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !158
  store i32* %5, i32** %data.addr, align 8, !dbg !159
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data.addr, align 8, !dbg !160
  ret i32* %6, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !162 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !163, metadata !DIExpression()), !dbg !164
  store i32* null, i32** %data, align 8, !dbg !165
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !166
  %0 = load i32*, i32** %data, align 8, !dbg !167
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !168
  store i32* %call, i32** %data, align 8, !dbg !169
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !170, metadata !DIExpression()), !dbg !172
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !174
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !175
  store i32 0, i32* %arrayidx, align 4, !dbg !176
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !177
  %1 = load i32*, i32** %data, align 8, !dbg !178
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !179
  %call4 = call i64 @wcslen(i32* %arraydecay3) #7, !dbg !180
  %call5 = call i32* @wcsncpy(i32* %arraydecay2, i32* %1, i64 %call4) #6, !dbg !181
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !182
  store i32 0, i32* %arrayidx6, align 4, !dbg !183
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !184
  call void @printWLine(i32* %arraydecay7), !dbg !185
  ret void, !dbg !186
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !187 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !188, metadata !DIExpression()), !dbg !189
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !190
  %tobool = icmp ne i32 %0, 0, !dbg !190
  br i1 %tobool, label %if.then, label %if.end3, !dbg !192

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !193, metadata !DIExpression()), !dbg !196
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !197
  %1 = bitcast i8* %call to i32*, !dbg !198
  store i32* %1, i32** %dataBuffer, align 8, !dbg !196
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !199
  %cmp = icmp eq i32* %2, null, !dbg !201
  br i1 %cmp, label %if.then1, label %if.end, !dbg !202

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !203
  unreachable, !dbg !203

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !205
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !206
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !207
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !207
  store i32 0, i32* %arrayidx, align 4, !dbg !208
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !209
  store i32* %5, i32** %data.addr, align 8, !dbg !210
  br label %if.end3, !dbg !211

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !212
  ret i32* %6, !dbg !213
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 67, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 68, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21_bad", scope: !15, file: !15, line: 42, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 44, type: !7)
!28 = !DILocation(line: 44, column: 15, scope: !24)
!29 = !DILocation(line: 45, column: 10, scope: !24)
!30 = !DILocation(line: 46, column: 15, scope: !24)
!31 = !DILocation(line: 47, column: 22, scope: !24)
!32 = !DILocation(line: 47, column: 12, scope: !24)
!33 = !DILocation(line: 47, column: 10, scope: !24)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !15, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 48, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 49, column: 17, scope: !35)
!40 = !DILocation(line: 50, column: 17, scope: !35)
!41 = !DILocation(line: 50, column: 9, scope: !35)
!42 = !DILocation(line: 51, column: 9, scope: !35)
!43 = !DILocation(line: 51, column: 21, scope: !35)
!44 = !DILocation(line: 53, column: 17, scope: !35)
!45 = !DILocation(line: 53, column: 23, scope: !35)
!46 = !DILocation(line: 53, column: 36, scope: !35)
!47 = !DILocation(line: 53, column: 29, scope: !35)
!48 = !DILocation(line: 53, column: 9, scope: !35)
!49 = !DILocation(line: 55, column: 9, scope: !35)
!50 = !DILocation(line: 55, column: 21, scope: !35)
!51 = !DILocation(line: 56, column: 20, scope: !35)
!52 = !DILocation(line: 56, column: 9, scope: !35)
!53 = !DILocation(line: 60, column: 1, scope: !24)
!54 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !55, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7}
!57 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !15, line: 26, type: !7)
!58 = !DILocation(line: 26, column: 38, scope: !54)
!59 = !DILocation(line: 28, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !15, line: 28, column: 8)
!61 = !DILocation(line: 28, column: 8, scope: !54)
!62 = !DILocalVariable(name: "dataBuffer", scope: !63, file: !15, line: 31, type: !7)
!63 = distinct !DILexicalBlock(scope: !64, file: !15, line: 30, column: 9)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 29, column: 5)
!65 = !DILocation(line: 31, column: 23, scope: !63)
!66 = !DILocation(line: 31, column: 47, scope: !63)
!67 = !DILocation(line: 31, column: 36, scope: !63)
!68 = !DILocation(line: 32, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !15, line: 32, column: 17)
!70 = !DILocation(line: 32, column: 28, scope: !69)
!71 = !DILocation(line: 32, column: 17, scope: !63)
!72 = !DILocation(line: 32, column: 38, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 32, column: 37)
!74 = !DILocation(line: 33, column: 21, scope: !63)
!75 = !DILocation(line: 33, column: 13, scope: !63)
!76 = !DILocation(line: 34, column: 13, scope: !63)
!77 = !DILocation(line: 34, column: 31, scope: !63)
!78 = !DILocation(line: 36, column: 20, scope: !63)
!79 = !DILocation(line: 36, column: 31, scope: !63)
!80 = !DILocation(line: 36, column: 18, scope: !63)
!81 = !DILocation(line: 38, column: 5, scope: !64)
!82 = !DILocation(line: 39, column: 12, scope: !54)
!83 = !DILocation(line: 39, column: 5, scope: !54)
!84 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_21_good", scope: !15, file: !15, line: 149, type: !25, scopeLine: 150, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 151, column: 5, scope: !84)
!86 = !DILocation(line: 152, column: 5, scope: !84)
!87 = !DILocation(line: 153, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 165, type: !89, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DISubroutineType(types: !90)
!90 = !{!10, !10, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 165, type: !10)
!95 = !DILocation(line: 165, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 165, type: !91)
!97 = !DILocation(line: 165, column: 27, scope: !88)
!98 = !DILocation(line: 168, column: 22, scope: !88)
!99 = !DILocation(line: 168, column: 12, scope: !88)
!100 = !DILocation(line: 168, column: 5, scope: !88)
!101 = !DILocation(line: 170, column: 5, scope: !88)
!102 = !DILocation(line: 171, column: 5, scope: !88)
!103 = !DILocation(line: 172, column: 5, scope: !88)
!104 = !DILocation(line: 175, column: 5, scope: !88)
!105 = !DILocation(line: 176, column: 5, scope: !88)
!106 = !DILocation(line: 177, column: 5, scope: !88)
!107 = !DILocation(line: 179, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 92, type: !25, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 94, type: !7)
!110 = !DILocation(line: 94, column: 15, scope: !108)
!111 = !DILocation(line: 95, column: 10, scope: !108)
!112 = !DILocation(line: 96, column: 20, scope: !108)
!113 = !DILocation(line: 97, column: 27, scope: !108)
!114 = !DILocation(line: 97, column: 12, scope: !108)
!115 = !DILocation(line: 97, column: 10, scope: !108)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !15, line: 99, type: !36)
!117 = distinct !DILexicalBlock(scope: !108, file: !15, line: 98, column: 5)
!118 = !DILocation(line: 99, column: 17, scope: !117)
!119 = !DILocation(line: 100, column: 17, scope: !117)
!120 = !DILocation(line: 100, column: 9, scope: !117)
!121 = !DILocation(line: 101, column: 9, scope: !117)
!122 = !DILocation(line: 101, column: 21, scope: !117)
!123 = !DILocation(line: 103, column: 17, scope: !117)
!124 = !DILocation(line: 103, column: 23, scope: !117)
!125 = !DILocation(line: 103, column: 36, scope: !117)
!126 = !DILocation(line: 103, column: 29, scope: !117)
!127 = !DILocation(line: 103, column: 9, scope: !117)
!128 = !DILocation(line: 105, column: 9, scope: !117)
!129 = !DILocation(line: 105, column: 21, scope: !117)
!130 = !DILocation(line: 106, column: 20, scope: !117)
!131 = !DILocation(line: 106, column: 9, scope: !117)
!132 = !DILocation(line: 110, column: 1, scope: !108)
!133 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 71, type: !55, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocalVariable(name: "data", arg: 1, scope: !133, file: !15, line: 71, type: !7)
!135 = !DILocation(line: 71, column: 43, scope: !133)
!136 = !DILocation(line: 73, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 73, column: 8)
!138 = !DILocation(line: 73, column: 8, scope: !133)
!139 = !DILocation(line: 76, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 74, column: 5)
!141 = !DILocation(line: 77, column: 5, scope: !140)
!142 = !DILocalVariable(name: "dataBuffer", scope: !143, file: !15, line: 81, type: !7)
!143 = distinct !DILexicalBlock(scope: !144, file: !15, line: 80, column: 9)
!144 = distinct !DILexicalBlock(scope: !137, file: !15, line: 79, column: 5)
!145 = !DILocation(line: 81, column: 23, scope: !143)
!146 = !DILocation(line: 81, column: 47, scope: !143)
!147 = !DILocation(line: 81, column: 36, scope: !143)
!148 = !DILocation(line: 82, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !15, line: 82, column: 17)
!150 = !DILocation(line: 82, column: 28, scope: !149)
!151 = !DILocation(line: 82, column: 17, scope: !143)
!152 = !DILocation(line: 82, column: 38, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 82, column: 37)
!154 = !DILocation(line: 83, column: 21, scope: !143)
!155 = !DILocation(line: 83, column: 13, scope: !143)
!156 = !DILocation(line: 84, column: 13, scope: !143)
!157 = !DILocation(line: 84, column: 31, scope: !143)
!158 = !DILocation(line: 86, column: 20, scope: !143)
!159 = !DILocation(line: 86, column: 18, scope: !143)
!160 = !DILocation(line: 89, column: 12, scope: !133)
!161 = !DILocation(line: 89, column: 5, scope: !133)
!162 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 129, type: !25, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DILocalVariable(name: "data", scope: !162, file: !15, line: 131, type: !7)
!164 = !DILocation(line: 131, column: 15, scope: !162)
!165 = !DILocation(line: 132, column: 10, scope: !162)
!166 = !DILocation(line: 133, column: 20, scope: !162)
!167 = !DILocation(line: 134, column: 27, scope: !162)
!168 = !DILocation(line: 134, column: 12, scope: !162)
!169 = !DILocation(line: 134, column: 10, scope: !162)
!170 = !DILocalVariable(name: "dest", scope: !171, file: !15, line: 136, type: !36)
!171 = distinct !DILexicalBlock(scope: !162, file: !15, line: 135, column: 5)
!172 = !DILocation(line: 136, column: 17, scope: !171)
!173 = !DILocation(line: 137, column: 17, scope: !171)
!174 = !DILocation(line: 137, column: 9, scope: !171)
!175 = !DILocation(line: 138, column: 9, scope: !171)
!176 = !DILocation(line: 138, column: 21, scope: !171)
!177 = !DILocation(line: 140, column: 17, scope: !171)
!178 = !DILocation(line: 140, column: 23, scope: !171)
!179 = !DILocation(line: 140, column: 36, scope: !171)
!180 = !DILocation(line: 140, column: 29, scope: !171)
!181 = !DILocation(line: 140, column: 9, scope: !171)
!182 = !DILocation(line: 142, column: 9, scope: !171)
!183 = !DILocation(line: 142, column: 21, scope: !171)
!184 = !DILocation(line: 143, column: 20, scope: !171)
!185 = !DILocation(line: 143, column: 9, scope: !171)
!186 = !DILocation(line: 147, column: 1, scope: !162)
!187 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 113, type: !55, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocalVariable(name: "data", arg: 1, scope: !187, file: !15, line: 113, type: !7)
!189 = !DILocation(line: 113, column: 43, scope: !187)
!190 = !DILocation(line: 115, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !15, line: 115, column: 8)
!192 = !DILocation(line: 115, column: 8, scope: !187)
!193 = !DILocalVariable(name: "dataBuffer", scope: !194, file: !15, line: 118, type: !7)
!194 = distinct !DILexicalBlock(scope: !195, file: !15, line: 117, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !15, line: 116, column: 5)
!196 = !DILocation(line: 118, column: 23, scope: !194)
!197 = !DILocation(line: 118, column: 47, scope: !194)
!198 = !DILocation(line: 118, column: 36, scope: !194)
!199 = !DILocation(line: 119, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !194, file: !15, line: 119, column: 17)
!201 = !DILocation(line: 119, column: 28, scope: !200)
!202 = !DILocation(line: 119, column: 17, scope: !194)
!203 = !DILocation(line: 119, column: 38, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !15, line: 119, column: 37)
!205 = !DILocation(line: 120, column: 21, scope: !194)
!206 = !DILocation(line: 120, column: 13, scope: !194)
!207 = !DILocation(line: 121, column: 13, scope: !194)
!208 = !DILocation(line: 121, column: 31, scope: !194)
!209 = !DILocation(line: 123, column: 20, scope: !194)
!210 = !DILocation(line: 123, column: 18, scope: !194)
!211 = !DILocation(line: 125, column: 5, scope: !195)
!212 = !DILocation(line: 126, column: 12, scope: !187)
!213 = !DILocation(line: 126, column: 5, scope: !187)
