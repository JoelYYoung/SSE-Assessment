; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %1, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !57
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !57
  %4 = load i32*, i32** %data, align 8, !dbg !58
  %5 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !58
  store i32 %3, i32* %arrayidx4, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %6, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !67
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !67
  store i32 0, i32* %arrayidx5, align 4, !dbg !68
  %8 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* %8), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04_good() #0 !dbg !72 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04_bad(), !dbg !93
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  store i32* %arraydecay, i32** %data, align 8, !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !115
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx2, align 4, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %1, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !127
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !127
  %4 = load i32*, i32** %data, align 8, !dbg !128
  %5 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !128
  store i32 %3, i32* %arrayidx4, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %6, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !136
  store i32 0, i32* %arrayidx5, align 4, !dbg !137
  %8 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* %8), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !148
  store i32* %arraydecay, i32** %data, align 8, !dbg !151
  %0 = load i32*, i32** %data, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  call void @llvm.dbg.declare(metadata i64* %i, metadata !154, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !157, metadata !DIExpression()), !dbg !158
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !159
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !160
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !161
  store i32 0, i32* %arrayidx2, align 4, !dbg !162
  store i64 0, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !166
  %cmp = icmp ult i64 %1, 100, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !172
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !172
  %4 = load i32*, i32** %data, align 8, !dbg !173
  %5 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !173
  store i32 %3, i32* %arrayidx4, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %6, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !181
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !181
  store i32 0, i32* %arrayidx5, align 4, !dbg !182
  %8 = load i32*, i32** %data, align 8, !dbg !183
  call void @printWLine(i32* %8), !dbg !184
  ret void, !dbg !185
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 32, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 33, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 34, column: 13, scope: !11)
!31 = !DILocation(line: 39, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 36, column: 5)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 8)
!34 = !DILocation(line: 39, column: 14, scope: !32)
!35 = !DILocation(line: 40, column: 9, scope: !32)
!36 = !DILocation(line: 40, column: 17, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !38, file: !12, line: 43, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 43, column: 16, scope: !38)
!42 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 44, type: !27)
!43 = !DILocation(line: 44, column: 17, scope: !38)
!44 = !DILocation(line: 45, column: 17, scope: !38)
!45 = !DILocation(line: 45, column: 9, scope: !38)
!46 = !DILocation(line: 46, column: 9, scope: !38)
!47 = !DILocation(line: 46, column: 23, scope: !38)
!48 = !DILocation(line: 48, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !12, line: 48, column: 9)
!50 = !DILocation(line: 48, column: 14, scope: !49)
!51 = !DILocation(line: 48, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 48, column: 9)
!53 = !DILocation(line: 48, column: 23, scope: !52)
!54 = !DILocation(line: 48, column: 9, scope: !49)
!55 = !DILocation(line: 50, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 49, column: 9)
!57 = !DILocation(line: 50, column: 23, scope: !56)
!58 = !DILocation(line: 50, column: 13, scope: !56)
!59 = !DILocation(line: 50, column: 18, scope: !56)
!60 = !DILocation(line: 50, column: 21, scope: !56)
!61 = !DILocation(line: 51, column: 9, scope: !56)
!62 = !DILocation(line: 48, column: 31, scope: !52)
!63 = !DILocation(line: 48, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 51, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 52, column: 9, scope: !38)
!68 = !DILocation(line: 52, column: 21, scope: !38)
!69 = !DILocation(line: 53, column: 20, scope: !38)
!70 = !DILocation(line: 53, column: 9, scope: !38)
!71 = !DILocation(line: 55, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_04_good", scope: !12, file: !12, line: 120, type: !13, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 122, column: 5, scope: !72)
!74 = !DILocation(line: 123, column: 5, scope: !72)
!75 = !DILocation(line: 124, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 136, type: !77, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!19, !19, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 136, type: !19)
!83 = !DILocation(line: 136, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 136, type: !79)
!85 = !DILocation(line: 136, column: 27, scope: !76)
!86 = !DILocation(line: 139, column: 22, scope: !76)
!87 = !DILocation(line: 139, column: 12, scope: !76)
!88 = !DILocation(line: 139, column: 5, scope: !76)
!89 = !DILocation(line: 141, column: 5, scope: !76)
!90 = !DILocation(line: 142, column: 5, scope: !76)
!91 = !DILocation(line: 143, column: 5, scope: !76)
!92 = !DILocation(line: 146, column: 5, scope: !76)
!93 = !DILocation(line: 147, column: 5, scope: !76)
!94 = !DILocation(line: 148, column: 5, scope: !76)
!95 = !DILocation(line: 150, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 64, type: !16)
!98 = !DILocation(line: 64, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 65, type: !22)
!100 = !DILocation(line: 65, column: 13, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 66, type: !27)
!102 = !DILocation(line: 66, column: 13, scope: !96)
!103 = !DILocation(line: 75, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !12, line: 73, column: 5)
!105 = distinct !DILexicalBlock(scope: !96, file: !12, line: 67, column: 8)
!106 = !DILocation(line: 75, column: 14, scope: !104)
!107 = !DILocation(line: 76, column: 9, scope: !104)
!108 = !DILocation(line: 76, column: 17, scope: !104)
!109 = !DILocalVariable(name: "i", scope: !110, file: !12, line: 79, type: !39)
!110 = distinct !DILexicalBlock(scope: !96, file: !12, line: 78, column: 5)
!111 = !DILocation(line: 79, column: 16, scope: !110)
!112 = !DILocalVariable(name: "source", scope: !110, file: !12, line: 80, type: !27)
!113 = !DILocation(line: 80, column: 17, scope: !110)
!114 = !DILocation(line: 81, column: 17, scope: !110)
!115 = !DILocation(line: 81, column: 9, scope: !110)
!116 = !DILocation(line: 82, column: 9, scope: !110)
!117 = !DILocation(line: 82, column: 23, scope: !110)
!118 = !DILocation(line: 84, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !12, line: 84, column: 9)
!120 = !DILocation(line: 84, column: 14, scope: !119)
!121 = !DILocation(line: 84, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 84, column: 9)
!123 = !DILocation(line: 84, column: 23, scope: !122)
!124 = !DILocation(line: 84, column: 9, scope: !119)
!125 = !DILocation(line: 86, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 85, column: 9)
!127 = !DILocation(line: 86, column: 23, scope: !126)
!128 = !DILocation(line: 86, column: 13, scope: !126)
!129 = !DILocation(line: 86, column: 18, scope: !126)
!130 = !DILocation(line: 86, column: 21, scope: !126)
!131 = !DILocation(line: 87, column: 9, scope: !126)
!132 = !DILocation(line: 84, column: 31, scope: !122)
!133 = !DILocation(line: 84, column: 9, scope: !122)
!134 = distinct !{!134, !124, !135, !66}
!135 = !DILocation(line: 87, column: 9, scope: !119)
!136 = !DILocation(line: 88, column: 9, scope: !110)
!137 = !DILocation(line: 88, column: 21, scope: !110)
!138 = !DILocation(line: 89, column: 20, scope: !110)
!139 = !DILocation(line: 89, column: 9, scope: !110)
!140 = !DILocation(line: 91, column: 1, scope: !96)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !12, line: 96, type: !16)
!143 = !DILocation(line: 96, column: 15, scope: !141)
!144 = !DILocalVariable(name: "dataBadBuffer", scope: !141, file: !12, line: 97, type: !22)
!145 = !DILocation(line: 97, column: 13, scope: !141)
!146 = !DILocalVariable(name: "dataGoodBuffer", scope: !141, file: !12, line: 98, type: !27)
!147 = !DILocation(line: 98, column: 13, scope: !141)
!148 = !DILocation(line: 102, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !12, line: 100, column: 5)
!150 = distinct !DILexicalBlock(scope: !141, file: !12, line: 99, column: 8)
!151 = !DILocation(line: 102, column: 14, scope: !149)
!152 = !DILocation(line: 103, column: 9, scope: !149)
!153 = !DILocation(line: 103, column: 17, scope: !149)
!154 = !DILocalVariable(name: "i", scope: !155, file: !12, line: 106, type: !39)
!155 = distinct !DILexicalBlock(scope: !141, file: !12, line: 105, column: 5)
!156 = !DILocation(line: 106, column: 16, scope: !155)
!157 = !DILocalVariable(name: "source", scope: !155, file: !12, line: 107, type: !27)
!158 = !DILocation(line: 107, column: 17, scope: !155)
!159 = !DILocation(line: 108, column: 17, scope: !155)
!160 = !DILocation(line: 108, column: 9, scope: !155)
!161 = !DILocation(line: 109, column: 9, scope: !155)
!162 = !DILocation(line: 109, column: 23, scope: !155)
!163 = !DILocation(line: 111, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !155, file: !12, line: 111, column: 9)
!165 = !DILocation(line: 111, column: 14, scope: !164)
!166 = !DILocation(line: 111, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !12, line: 111, column: 9)
!168 = !DILocation(line: 111, column: 23, scope: !167)
!169 = !DILocation(line: 111, column: 9, scope: !164)
!170 = !DILocation(line: 113, column: 30, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !12, line: 112, column: 9)
!172 = !DILocation(line: 113, column: 23, scope: !171)
!173 = !DILocation(line: 113, column: 13, scope: !171)
!174 = !DILocation(line: 113, column: 18, scope: !171)
!175 = !DILocation(line: 113, column: 21, scope: !171)
!176 = !DILocation(line: 114, column: 9, scope: !171)
!177 = !DILocation(line: 111, column: 31, scope: !167)
!178 = !DILocation(line: 111, column: 9, scope: !167)
!179 = distinct !{!179, !169, !180, !66}
!180 = !DILocation(line: 114, column: 9, scope: !164)
!181 = !DILocation(line: 115, column: 9, scope: !155)
!182 = !DILocation(line: 115, column: 21, scope: !155)
!183 = !DILocation(line: 116, column: 20, scope: !155)
!184 = !DILocation(line: 116, column: 9, scope: !155)
!185 = !DILocation(line: 118, column: 1, scope: !141)
