; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21.c"
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21_bad() #0 !dbg !24 {
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
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !46
  %2 = load i32*, i32** %data, align 8, !dbg !47
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !47
  store i32 0, i32* %arrayidx4, align 4, !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %3), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @badStatic, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.end3, !dbg !59

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !63
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !64
  %1 = bitcast i8* %call to i32*, !dbg !65
  store i32* %1, i32** %dataBuffer, align 8, !dbg !63
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  %cmp = icmp eq i32* %2, null, !dbg !68
  br i1 %cmp, label %if.then1, label %if.end, !dbg !69

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !70
  unreachable, !dbg !70

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !73
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !77
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !78
  br label %if.end3, !dbg !79

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !80
  ret i32* %6, !dbg !81
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #5, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #5, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32* null, i32** %data, align 8, !dbg !109
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !110
  %0 = load i32*, i32** %data, align 8, !dbg !111
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !112
  store i32* %call, i32** %data, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !118
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !122
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !123
  %2 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !124
  store i32 0, i32* %arrayidx4, align 4, !dbg !125
  %3 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* %3), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !129 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !132
  %tobool = icmp ne i32 %0, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !135
  br label %if.end3, !dbg !137

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !138, metadata !DIExpression()), !dbg !141
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !142
  %1 = bitcast i8* %call to i32*, !dbg !143
  store i32* %1, i32** %dataBuffer, align 8, !dbg !141
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !144
  %cmp = icmp eq i32* %2, null, !dbg !146
  br i1 %cmp, label %if.then1, label %if.end, !dbg !147

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !151
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  store i32* %5, i32** %data.addr, align 8, !dbg !155
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data.addr, align 8, !dbg !156
  ret i32* %6, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !158 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !159, metadata !DIExpression()), !dbg !160
  store i32* null, i32** %data, align 8, !dbg !161
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !162
  %0 = load i32*, i32** %data, align 8, !dbg !163
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !164
  store i32* %call, i32** %data, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !166, metadata !DIExpression()), !dbg !168
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !169
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !170
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !171
  store i32 0, i32* %arrayidx, align 4, !dbg !172
  %1 = load i32*, i32** %data, align 8, !dbg !173
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !174
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !175
  %2 = load i32*, i32** %data, align 8, !dbg !176
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !176
  store i32 0, i32* %arrayidx4, align 4, !dbg !177
  %3 = load i32*, i32** %data, align 8, !dbg !178
  call void @printWLine(i32* %3), !dbg !179
  ret void, !dbg !180
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !181 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !182, metadata !DIExpression()), !dbg !183
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !184
  %tobool = icmp ne i32 %0, 0, !dbg !184
  br i1 %tobool, label %if.then, label %if.end3, !dbg !186

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !187, metadata !DIExpression()), !dbg !190
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !191
  %1 = bitcast i8* %call to i32*, !dbg !192
  store i32* %1, i32** %dataBuffer, align 8, !dbg !190
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !193
  %cmp = icmp eq i32* %2, null, !dbg !195
  br i1 %cmp, label %if.then1, label %if.end, !dbg !196

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !197
  unreachable, !dbg !197

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !199
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !200
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !201
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !201
  store i32 0, i32* %arrayidx, align 4, !dbg !202
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !203
  store i32* %5, i32** %data.addr, align 8, !dbg !204
  br label %if.end3, !dbg !205

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data.addr, align 8, !dbg !206
  ret i32* %6, !dbg !207
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 68, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21_bad", scope: !15, file: !15, line: 42, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 44, type: !7)
!28 = !DILocation(line: 44, column: 15, scope: !24)
!29 = !DILocation(line: 45, column: 10, scope: !24)
!30 = !DILocation(line: 46, column: 15, scope: !24)
!31 = !DILocation(line: 47, column: 22, scope: !24)
!32 = !DILocation(line: 47, column: 12, scope: !24)
!33 = !DILocation(line: 47, column: 10, scope: !24)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 48, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 49, column: 17, scope: !35)
!40 = !DILocation(line: 50, column: 17, scope: !35)
!41 = !DILocation(line: 50, column: 9, scope: !35)
!42 = !DILocation(line: 51, column: 9, scope: !35)
!43 = !DILocation(line: 51, column: 23, scope: !35)
!44 = !DILocation(line: 53, column: 17, scope: !35)
!45 = !DILocation(line: 53, column: 23, scope: !35)
!46 = !DILocation(line: 53, column: 9, scope: !35)
!47 = !DILocation(line: 55, column: 9, scope: !35)
!48 = !DILocation(line: 55, column: 21, scope: !35)
!49 = !DILocation(line: 56, column: 20, scope: !35)
!50 = !DILocation(line: 56, column: 9, scope: !35)
!51 = !DILocation(line: 60, column: 1, scope: !24)
!52 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !53, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7}
!55 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !15, line: 26, type: !7)
!56 = !DILocation(line: 26, column: 38, scope: !52)
!57 = !DILocation(line: 28, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !15, line: 28, column: 8)
!59 = !DILocation(line: 28, column: 8, scope: !52)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !15, line: 31, type: !7)
!61 = distinct !DILexicalBlock(scope: !62, file: !15, line: 30, column: 9)
!62 = distinct !DILexicalBlock(scope: !58, file: !15, line: 29, column: 5)
!63 = !DILocation(line: 31, column: 23, scope: !61)
!64 = !DILocation(line: 31, column: 47, scope: !61)
!65 = !DILocation(line: 31, column: 36, scope: !61)
!66 = !DILocation(line: 32, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !15, line: 32, column: 17)
!68 = !DILocation(line: 32, column: 28, scope: !67)
!69 = !DILocation(line: 32, column: 17, scope: !61)
!70 = !DILocation(line: 32, column: 38, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 32, column: 37)
!72 = !DILocation(line: 33, column: 21, scope: !61)
!73 = !DILocation(line: 33, column: 13, scope: !61)
!74 = !DILocation(line: 34, column: 13, scope: !61)
!75 = !DILocation(line: 34, column: 31, scope: !61)
!76 = !DILocation(line: 36, column: 20, scope: !61)
!77 = !DILocation(line: 36, column: 31, scope: !61)
!78 = !DILocation(line: 36, column: 18, scope: !61)
!79 = !DILocation(line: 38, column: 5, scope: !62)
!80 = !DILocation(line: 39, column: 12, scope: !52)
!81 = !DILocation(line: 39, column: 5, scope: !52)
!82 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_21_good", scope: !15, file: !15, line: 149, type: !25, scopeLine: 150, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocation(line: 151, column: 5, scope: !82)
!84 = !DILocation(line: 152, column: 5, scope: !82)
!85 = !DILocation(line: 153, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 165, type: !87, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DISubroutineType(types: !88)
!88 = !{!10, !10, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !15, line: 165, type: !10)
!93 = !DILocation(line: 165, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !15, line: 165, type: !89)
!95 = !DILocation(line: 165, column: 27, scope: !86)
!96 = !DILocation(line: 168, column: 22, scope: !86)
!97 = !DILocation(line: 168, column: 12, scope: !86)
!98 = !DILocation(line: 168, column: 5, scope: !86)
!99 = !DILocation(line: 170, column: 5, scope: !86)
!100 = !DILocation(line: 171, column: 5, scope: !86)
!101 = !DILocation(line: 172, column: 5, scope: !86)
!102 = !DILocation(line: 175, column: 5, scope: !86)
!103 = !DILocation(line: 176, column: 5, scope: !86)
!104 = !DILocation(line: 177, column: 5, scope: !86)
!105 = !DILocation(line: 179, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 92, type: !25, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !15, line: 94, type: !7)
!108 = !DILocation(line: 94, column: 15, scope: !106)
!109 = !DILocation(line: 95, column: 10, scope: !106)
!110 = !DILocation(line: 96, column: 20, scope: !106)
!111 = !DILocation(line: 97, column: 27, scope: !106)
!112 = !DILocation(line: 97, column: 12, scope: !106)
!113 = !DILocation(line: 97, column: 10, scope: !106)
!114 = !DILocalVariable(name: "source", scope: !115, file: !15, line: 99, type: !36)
!115 = distinct !DILexicalBlock(scope: !106, file: !15, line: 98, column: 5)
!116 = !DILocation(line: 99, column: 17, scope: !115)
!117 = !DILocation(line: 100, column: 17, scope: !115)
!118 = !DILocation(line: 100, column: 9, scope: !115)
!119 = !DILocation(line: 101, column: 9, scope: !115)
!120 = !DILocation(line: 101, column: 23, scope: !115)
!121 = !DILocation(line: 103, column: 17, scope: !115)
!122 = !DILocation(line: 103, column: 23, scope: !115)
!123 = !DILocation(line: 103, column: 9, scope: !115)
!124 = !DILocation(line: 105, column: 9, scope: !115)
!125 = !DILocation(line: 105, column: 21, scope: !115)
!126 = !DILocation(line: 106, column: 20, scope: !115)
!127 = !DILocation(line: 106, column: 9, scope: !115)
!128 = !DILocation(line: 110, column: 1, scope: !106)
!129 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 71, type: !53, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", arg: 1, scope: !129, file: !15, line: 71, type: !7)
!131 = !DILocation(line: 71, column: 43, scope: !129)
!132 = !DILocation(line: 73, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 73, column: 8)
!134 = !DILocation(line: 73, column: 8, scope: !129)
!135 = !DILocation(line: 76, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 74, column: 5)
!137 = !DILocation(line: 77, column: 5, scope: !136)
!138 = !DILocalVariable(name: "dataBuffer", scope: !139, file: !15, line: 81, type: !7)
!139 = distinct !DILexicalBlock(scope: !140, file: !15, line: 80, column: 9)
!140 = distinct !DILexicalBlock(scope: !133, file: !15, line: 79, column: 5)
!141 = !DILocation(line: 81, column: 23, scope: !139)
!142 = !DILocation(line: 81, column: 47, scope: !139)
!143 = !DILocation(line: 81, column: 36, scope: !139)
!144 = !DILocation(line: 82, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !15, line: 82, column: 17)
!146 = !DILocation(line: 82, column: 28, scope: !145)
!147 = !DILocation(line: 82, column: 17, scope: !139)
!148 = !DILocation(line: 82, column: 38, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 82, column: 37)
!150 = !DILocation(line: 83, column: 21, scope: !139)
!151 = !DILocation(line: 83, column: 13, scope: !139)
!152 = !DILocation(line: 84, column: 13, scope: !139)
!153 = !DILocation(line: 84, column: 31, scope: !139)
!154 = !DILocation(line: 86, column: 20, scope: !139)
!155 = !DILocation(line: 86, column: 18, scope: !139)
!156 = !DILocation(line: 89, column: 12, scope: !129)
!157 = !DILocation(line: 89, column: 5, scope: !129)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 129, type: !25, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DILocalVariable(name: "data", scope: !158, file: !15, line: 131, type: !7)
!160 = !DILocation(line: 131, column: 15, scope: !158)
!161 = !DILocation(line: 132, column: 10, scope: !158)
!162 = !DILocation(line: 133, column: 20, scope: !158)
!163 = !DILocation(line: 134, column: 27, scope: !158)
!164 = !DILocation(line: 134, column: 12, scope: !158)
!165 = !DILocation(line: 134, column: 10, scope: !158)
!166 = !DILocalVariable(name: "source", scope: !167, file: !15, line: 136, type: !36)
!167 = distinct !DILexicalBlock(scope: !158, file: !15, line: 135, column: 5)
!168 = !DILocation(line: 136, column: 17, scope: !167)
!169 = !DILocation(line: 137, column: 17, scope: !167)
!170 = !DILocation(line: 137, column: 9, scope: !167)
!171 = !DILocation(line: 138, column: 9, scope: !167)
!172 = !DILocation(line: 138, column: 23, scope: !167)
!173 = !DILocation(line: 140, column: 17, scope: !167)
!174 = !DILocation(line: 140, column: 23, scope: !167)
!175 = !DILocation(line: 140, column: 9, scope: !167)
!176 = !DILocation(line: 142, column: 9, scope: !167)
!177 = !DILocation(line: 142, column: 21, scope: !167)
!178 = !DILocation(line: 143, column: 20, scope: !167)
!179 = !DILocation(line: 143, column: 9, scope: !167)
!180 = !DILocation(line: 147, column: 1, scope: !158)
!181 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 113, type: !53, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DILocalVariable(name: "data", arg: 1, scope: !181, file: !15, line: 113, type: !7)
!183 = !DILocation(line: 113, column: 43, scope: !181)
!184 = !DILocation(line: 115, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !15, line: 115, column: 8)
!186 = !DILocation(line: 115, column: 8, scope: !181)
!187 = !DILocalVariable(name: "dataBuffer", scope: !188, file: !15, line: 118, type: !7)
!188 = distinct !DILexicalBlock(scope: !189, file: !15, line: 117, column: 9)
!189 = distinct !DILexicalBlock(scope: !185, file: !15, line: 116, column: 5)
!190 = !DILocation(line: 118, column: 23, scope: !188)
!191 = !DILocation(line: 118, column: 47, scope: !188)
!192 = !DILocation(line: 118, column: 36, scope: !188)
!193 = !DILocation(line: 119, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !15, line: 119, column: 17)
!195 = !DILocation(line: 119, column: 28, scope: !194)
!196 = !DILocation(line: 119, column: 17, scope: !188)
!197 = !DILocation(line: 119, column: 38, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !15, line: 119, column: 37)
!199 = !DILocation(line: 120, column: 21, scope: !188)
!200 = !DILocation(line: 120, column: 13, scope: !188)
!201 = !DILocation(line: 121, column: 13, scope: !188)
!202 = !DILocation(line: 121, column: 31, scope: !188)
!203 = !DILocation(line: 123, column: 20, scope: !188)
!204 = !DILocation(line: 123, column: 18, scope: !188)
!205 = !DILocation(line: 125, column: 5, scope: !189)
!206 = !DILocation(line: 126, column: 12, scope: !181)
!207 = !DILocation(line: 126, column: 5, scope: !181)
