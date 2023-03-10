; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_03.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_03_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !32
  store i32* %add.ptr, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %5, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !55
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !55
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !55
  %9 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !59
  store i32 %8, i32* %arrayidx4, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %10, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx5, align 4, !dbg !68
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !69
  call void @printWLine(i32* %arraydecay6), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_03_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #4, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #4, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_03_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_03_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 400, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBuffer, align 8, !dbg !100
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !104
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  store i32* %4, i32** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !117
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx2, align 4, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !123
  %cmp = icmp ult i64 %5, 100, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !127
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !127
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !127
  %9 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !131
  store i32 %8, i32* %arrayidx4, align 4, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %10, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx5, align 4, !dbg !139
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  call void @printWLine(i32* %arraydecay6), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %0 = alloca i8, i64 400, align 16, !dbg !148
  %1 = bitcast i8* %0 to i32*, !dbg !149
  store i32* %1, i32** %dataBuffer, align 8, !dbg !147
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !151
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  store i32* %4, i32** %data, align 8, !dbg !157
  call void @llvm.dbg.declare(metadata i64* %i, metadata !158, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !161, metadata !DIExpression()), !dbg !162
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !164
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx2, align 4, !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !170
  %cmp = icmp ult i64 %5, 100, !dbg !172
  br i1 %cmp, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !174
  %7 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !174
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !174
  %9 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !178
  store i32 %8, i32* %arrayidx4, align 4, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %10, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !185
  store i32 0, i32* %arrayidx5, align 4, !dbg !186
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !187
  call void @printWLine(i32* %arraydecay6), !dbg !188
  ret void, !dbg !189
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_03_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_03.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 30, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 8)
!32 = !DILocation(line: 32, column: 27, scope: !30)
!33 = !DILocation(line: 32, column: 14, scope: !30)
!34 = !DILocalVariable(name: "i", scope: !35, file: !16, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !37)
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 35, column: 16, scope: !35)
!39 = !DILocalVariable(name: "dest", scope: !35, file: !16, line: 36, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 36, column: 17, scope: !35)
!44 = !DILocation(line: 37, column: 17, scope: !35)
!45 = !DILocation(line: 37, column: 9, scope: !35)
!46 = !DILocation(line: 38, column: 9, scope: !35)
!47 = !DILocation(line: 38, column: 21, scope: !35)
!48 = !DILocation(line: 40, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !16, line: 40, column: 9)
!50 = !DILocation(line: 40, column: 14, scope: !49)
!51 = !DILocation(line: 40, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !16, line: 40, column: 9)
!53 = !DILocation(line: 40, column: 23, scope: !52)
!54 = !DILocation(line: 40, column: 9, scope: !49)
!55 = !DILocation(line: 42, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !16, line: 41, column: 9)
!57 = !DILocation(line: 42, column: 28, scope: !56)
!58 = !DILocation(line: 42, column: 18, scope: !56)
!59 = !DILocation(line: 42, column: 13, scope: !56)
!60 = !DILocation(line: 42, column: 21, scope: !56)
!61 = !DILocation(line: 43, column: 9, scope: !56)
!62 = !DILocation(line: 40, column: 31, scope: !52)
!63 = !DILocation(line: 40, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 43, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 45, column: 9, scope: !35)
!68 = !DILocation(line: 45, column: 21, scope: !35)
!69 = !DILocation(line: 46, column: 20, scope: !35)
!70 = !DILocation(line: 46, column: 9, scope: !35)
!71 = !DILocation(line: 48, column: 1, scope: !15)
!72 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_03_good", scope: !16, file: !16, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 117, column: 5, scope: !72)
!74 = !DILocation(line: 118, column: 5, scope: !72)
!75 = !DILocation(line: 119, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 131, type: !77, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!7, !7, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !16, line: 131, type: !7)
!83 = !DILocation(line: 131, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !16, line: 131, type: !79)
!85 = !DILocation(line: 131, column: 27, scope: !76)
!86 = !DILocation(line: 134, column: 22, scope: !76)
!87 = !DILocation(line: 134, column: 12, scope: !76)
!88 = !DILocation(line: 134, column: 5, scope: !76)
!89 = !DILocation(line: 136, column: 5, scope: !76)
!90 = !DILocation(line: 137, column: 5, scope: !76)
!91 = !DILocation(line: 138, column: 5, scope: !76)
!92 = !DILocation(line: 141, column: 5, scope: !76)
!93 = !DILocation(line: 142, column: 5, scope: !76)
!94 = !DILocation(line: 143, column: 5, scope: !76)
!95 = !DILocation(line: 145, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !16, line: 57, type: !4)
!98 = !DILocation(line: 57, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !16, line: 58, type: !4)
!100 = !DILocation(line: 58, column: 15, scope: !96)
!101 = !DILocation(line: 58, column: 39, scope: !96)
!102 = !DILocation(line: 58, column: 28, scope: !96)
!103 = !DILocation(line: 59, column: 13, scope: !96)
!104 = !DILocation(line: 59, column: 5, scope: !96)
!105 = !DILocation(line: 60, column: 5, scope: !96)
!106 = !DILocation(line: 60, column: 23, scope: !96)
!107 = !DILocation(line: 69, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !16, line: 67, column: 5)
!109 = distinct !DILexicalBlock(scope: !96, file: !16, line: 61, column: 8)
!110 = !DILocation(line: 69, column: 14, scope: !108)
!111 = !DILocalVariable(name: "i", scope: !112, file: !16, line: 72, type: !36)
!112 = distinct !DILexicalBlock(scope: !96, file: !16, line: 71, column: 5)
!113 = !DILocation(line: 72, column: 16, scope: !112)
!114 = !DILocalVariable(name: "dest", scope: !112, file: !16, line: 73, type: !40)
!115 = !DILocation(line: 73, column: 17, scope: !112)
!116 = !DILocation(line: 74, column: 17, scope: !112)
!117 = !DILocation(line: 74, column: 9, scope: !112)
!118 = !DILocation(line: 75, column: 9, scope: !112)
!119 = !DILocation(line: 75, column: 21, scope: !112)
!120 = !DILocation(line: 77, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !112, file: !16, line: 77, column: 9)
!122 = !DILocation(line: 77, column: 14, scope: !121)
!123 = !DILocation(line: 77, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !16, line: 77, column: 9)
!125 = !DILocation(line: 77, column: 23, scope: !124)
!126 = !DILocation(line: 77, column: 9, scope: !121)
!127 = !DILocation(line: 79, column: 23, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !16, line: 78, column: 9)
!129 = !DILocation(line: 79, column: 28, scope: !128)
!130 = !DILocation(line: 79, column: 18, scope: !128)
!131 = !DILocation(line: 79, column: 13, scope: !128)
!132 = !DILocation(line: 79, column: 21, scope: !128)
!133 = !DILocation(line: 80, column: 9, scope: !128)
!134 = !DILocation(line: 77, column: 31, scope: !124)
!135 = !DILocation(line: 77, column: 9, scope: !124)
!136 = distinct !{!136, !126, !137, !66}
!137 = !DILocation(line: 80, column: 9, scope: !121)
!138 = !DILocation(line: 82, column: 9, scope: !112)
!139 = !DILocation(line: 82, column: 21, scope: !112)
!140 = !DILocation(line: 83, column: 20, scope: !112)
!141 = !DILocation(line: 83, column: 9, scope: !112)
!142 = !DILocation(line: 85, column: 1, scope: !96)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 88, type: !17, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", scope: !143, file: !16, line: 90, type: !4)
!145 = !DILocation(line: 90, column: 15, scope: !143)
!146 = !DILocalVariable(name: "dataBuffer", scope: !143, file: !16, line: 91, type: !4)
!147 = !DILocation(line: 91, column: 15, scope: !143)
!148 = !DILocation(line: 91, column: 39, scope: !143)
!149 = !DILocation(line: 91, column: 28, scope: !143)
!150 = !DILocation(line: 92, column: 13, scope: !143)
!151 = !DILocation(line: 92, column: 5, scope: !143)
!152 = !DILocation(line: 93, column: 5, scope: !143)
!153 = !DILocation(line: 93, column: 23, scope: !143)
!154 = !DILocation(line: 97, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !156, file: !16, line: 95, column: 5)
!156 = distinct !DILexicalBlock(scope: !143, file: !16, line: 94, column: 8)
!157 = !DILocation(line: 97, column: 14, scope: !155)
!158 = !DILocalVariable(name: "i", scope: !159, file: !16, line: 100, type: !36)
!159 = distinct !DILexicalBlock(scope: !143, file: !16, line: 99, column: 5)
!160 = !DILocation(line: 100, column: 16, scope: !159)
!161 = !DILocalVariable(name: "dest", scope: !159, file: !16, line: 101, type: !40)
!162 = !DILocation(line: 101, column: 17, scope: !159)
!163 = !DILocation(line: 102, column: 17, scope: !159)
!164 = !DILocation(line: 102, column: 9, scope: !159)
!165 = !DILocation(line: 103, column: 9, scope: !159)
!166 = !DILocation(line: 103, column: 21, scope: !159)
!167 = !DILocation(line: 105, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !159, file: !16, line: 105, column: 9)
!169 = !DILocation(line: 105, column: 14, scope: !168)
!170 = !DILocation(line: 105, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !16, line: 105, column: 9)
!172 = !DILocation(line: 105, column: 23, scope: !171)
!173 = !DILocation(line: 105, column: 9, scope: !168)
!174 = !DILocation(line: 107, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !16, line: 106, column: 9)
!176 = !DILocation(line: 107, column: 28, scope: !175)
!177 = !DILocation(line: 107, column: 18, scope: !175)
!178 = !DILocation(line: 107, column: 13, scope: !175)
!179 = !DILocation(line: 107, column: 21, scope: !175)
!180 = !DILocation(line: 108, column: 9, scope: !175)
!181 = !DILocation(line: 105, column: 31, scope: !171)
!182 = !DILocation(line: 105, column: 9, scope: !171)
!183 = distinct !{!183, !173, !184, !66}
!184 = !DILocation(line: 108, column: 9, scope: !168)
!185 = !DILocation(line: 110, column: 9, scope: !159)
!186 = !DILocation(line: 110, column: 21, scope: !159)
!187 = !DILocation(line: 111, column: 20, scope: !159)
!188 = !DILocation(line: 111, column: 9, scope: !159)
!189 = !DILocation(line: 113, column: 1, scope: !143)
