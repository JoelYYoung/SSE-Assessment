; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15_bad() #0 !dbg !11 {
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
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx2, align 4, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %1, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !55
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !55
  %4 = load i32*, i32** %data, align 8, !dbg !56
  %5 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !56
  store i32 %3, i32* %arrayidx4, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !65
  store i32 0, i32* %arrayidx5, align 4, !dbg !66
  %8 = load i32*, i32** %data, align 8, !dbg !67
  call void @printWLine(i32* %8), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #4, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #4, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i32* %arraydecay, i32** %data, align 8, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata i64* %i, metadata !105, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !111
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx2, align 4, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !117
  %cmp = icmp ult i64 %1, 100, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !123
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !123
  %4 = load i32*, i32** %data, align 8, !dbg !124
  %5 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !124
  store i32 %3, i32* %arrayidx4, align 4, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %6, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !132
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !132
  store i32 0, i32* %arrayidx5, align 4, !dbg !133
  %8 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %8), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !137 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !144
  store i32* %arraydecay, i32** %data, align 8, !dbg !145
  %0 = load i32*, i32** %data, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  call void @llvm.dbg.declare(metadata i64* %i, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !151, metadata !DIExpression()), !dbg !152
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !153
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !154
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !155
  store i32 0, i32* %arrayidx2, align 4, !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !160
  %cmp = icmp ult i64 %1, 100, !dbg !162
  br i1 %cmp, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !166
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !166
  %4 = load i32*, i32** %data, align 8, !dbg !167
  %5 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !167
  store i32 %3, i32* %arrayidx4, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %6, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !175
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !175
  store i32 0, i32* %arrayidx5, align 4, !dbg !176
  %8 = load i32*, i32** %data, align 8, !dbg !177
  call void @printWLine(i32* %8), !dbg !178
  ret void, !dbg !179
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 33, column: 16, scope: !11)
!32 = !DILocation(line: 33, column: 14, scope: !11)
!33 = !DILocation(line: 34, column: 9, scope: !11)
!34 = !DILocation(line: 34, column: 17, scope: !11)
!35 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 42, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 42, column: 16, scope: !36)
!40 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 43, type: !27)
!41 = !DILocation(line: 43, column: 17, scope: !36)
!42 = !DILocation(line: 44, column: 17, scope: !36)
!43 = !DILocation(line: 44, column: 9, scope: !36)
!44 = !DILocation(line: 45, column: 9, scope: !36)
!45 = !DILocation(line: 45, column: 23, scope: !36)
!46 = !DILocation(line: 47, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !12, line: 47, column: 9)
!48 = !DILocation(line: 47, column: 14, scope: !47)
!49 = !DILocation(line: 47, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 47, column: 9)
!51 = !DILocation(line: 47, column: 23, scope: !50)
!52 = !DILocation(line: 47, column: 9, scope: !47)
!53 = !DILocation(line: 49, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 48, column: 9)
!55 = !DILocation(line: 49, column: 23, scope: !54)
!56 = !DILocation(line: 49, column: 13, scope: !54)
!57 = !DILocation(line: 49, column: 18, scope: !54)
!58 = !DILocation(line: 49, column: 21, scope: !54)
!59 = !DILocation(line: 50, column: 9, scope: !54)
!60 = !DILocation(line: 47, column: 31, scope: !50)
!61 = !DILocation(line: 47, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 50, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 51, column: 9, scope: !36)
!66 = !DILocation(line: 51, column: 21, scope: !36)
!67 = !DILocation(line: 52, column: 20, scope: !36)
!68 = !DILocation(line: 52, column: 9, scope: !36)
!69 = !DILocation(line: 54, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_15_good", scope: !12, file: !12, line: 126, type: !13, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 128, column: 5, scope: !70)
!72 = !DILocation(line: 129, column: 5, scope: !70)
!73 = !DILocation(line: 130, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 142, type: !75, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!19, !19, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 142, type: !19)
!81 = !DILocation(line: 142, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 142, type: !77)
!83 = !DILocation(line: 142, column: 27, scope: !74)
!84 = !DILocation(line: 145, column: 22, scope: !74)
!85 = !DILocation(line: 145, column: 12, scope: !74)
!86 = !DILocation(line: 145, column: 5, scope: !74)
!87 = !DILocation(line: 147, column: 5, scope: !74)
!88 = !DILocation(line: 148, column: 5, scope: !74)
!89 = !DILocation(line: 149, column: 5, scope: !74)
!90 = !DILocation(line: 152, column: 5, scope: !74)
!91 = !DILocation(line: 153, column: 5, scope: !74)
!92 = !DILocation(line: 154, column: 5, scope: !74)
!93 = !DILocation(line: 156, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 63, type: !16)
!96 = !DILocation(line: 63, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !12, line: 64, type: !22)
!98 = !DILocation(line: 64, column: 13, scope: !94)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !12, line: 65, type: !27)
!100 = !DILocation(line: 65, column: 13, scope: !94)
!101 = !DILocation(line: 74, column: 16, scope: !94)
!102 = !DILocation(line: 74, column: 14, scope: !94)
!103 = !DILocation(line: 75, column: 9, scope: !94)
!104 = !DILocation(line: 75, column: 17, scope: !94)
!105 = !DILocalVariable(name: "i", scope: !106, file: !12, line: 79, type: !37)
!106 = distinct !DILexicalBlock(scope: !94, file: !12, line: 78, column: 5)
!107 = !DILocation(line: 79, column: 16, scope: !106)
!108 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 80, type: !27)
!109 = !DILocation(line: 80, column: 17, scope: !106)
!110 = !DILocation(line: 81, column: 17, scope: !106)
!111 = !DILocation(line: 81, column: 9, scope: !106)
!112 = !DILocation(line: 82, column: 9, scope: !106)
!113 = !DILocation(line: 82, column: 23, scope: !106)
!114 = !DILocation(line: 84, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !106, file: !12, line: 84, column: 9)
!116 = !DILocation(line: 84, column: 14, scope: !115)
!117 = !DILocation(line: 84, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 84, column: 9)
!119 = !DILocation(line: 84, column: 23, scope: !118)
!120 = !DILocation(line: 84, column: 9, scope: !115)
!121 = !DILocation(line: 86, column: 30, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 85, column: 9)
!123 = !DILocation(line: 86, column: 23, scope: !122)
!124 = !DILocation(line: 86, column: 13, scope: !122)
!125 = !DILocation(line: 86, column: 18, scope: !122)
!126 = !DILocation(line: 86, column: 21, scope: !122)
!127 = !DILocation(line: 87, column: 9, scope: !122)
!128 = !DILocation(line: 84, column: 31, scope: !118)
!129 = !DILocation(line: 84, column: 9, scope: !118)
!130 = distinct !{!130, !120, !131, !64}
!131 = !DILocation(line: 87, column: 9, scope: !115)
!132 = !DILocation(line: 88, column: 9, scope: !106)
!133 = !DILocation(line: 88, column: 21, scope: !106)
!134 = !DILocation(line: 89, column: 20, scope: !106)
!135 = !DILocation(line: 89, column: 9, scope: !106)
!136 = !DILocation(line: 91, column: 1, scope: !94)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !12, line: 96, type: !16)
!139 = !DILocation(line: 96, column: 15, scope: !137)
!140 = !DILocalVariable(name: "dataBadBuffer", scope: !137, file: !12, line: 97, type: !22)
!141 = !DILocation(line: 97, column: 13, scope: !137)
!142 = !DILocalVariable(name: "dataGoodBuffer", scope: !137, file: !12, line: 98, type: !27)
!143 = !DILocation(line: 98, column: 13, scope: !137)
!144 = !DILocation(line: 103, column: 16, scope: !137)
!145 = !DILocation(line: 103, column: 14, scope: !137)
!146 = !DILocation(line: 104, column: 9, scope: !137)
!147 = !DILocation(line: 104, column: 17, scope: !137)
!148 = !DILocalVariable(name: "i", scope: !149, file: !12, line: 112, type: !37)
!149 = distinct !DILexicalBlock(scope: !137, file: !12, line: 111, column: 5)
!150 = !DILocation(line: 112, column: 16, scope: !149)
!151 = !DILocalVariable(name: "source", scope: !149, file: !12, line: 113, type: !27)
!152 = !DILocation(line: 113, column: 17, scope: !149)
!153 = !DILocation(line: 114, column: 17, scope: !149)
!154 = !DILocation(line: 114, column: 9, scope: !149)
!155 = !DILocation(line: 115, column: 9, scope: !149)
!156 = !DILocation(line: 115, column: 23, scope: !149)
!157 = !DILocation(line: 117, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !149, file: !12, line: 117, column: 9)
!159 = !DILocation(line: 117, column: 14, scope: !158)
!160 = !DILocation(line: 117, column: 21, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !12, line: 117, column: 9)
!162 = !DILocation(line: 117, column: 23, scope: !161)
!163 = !DILocation(line: 117, column: 9, scope: !158)
!164 = !DILocation(line: 119, column: 30, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 118, column: 9)
!166 = !DILocation(line: 119, column: 23, scope: !165)
!167 = !DILocation(line: 119, column: 13, scope: !165)
!168 = !DILocation(line: 119, column: 18, scope: !165)
!169 = !DILocation(line: 119, column: 21, scope: !165)
!170 = !DILocation(line: 120, column: 9, scope: !165)
!171 = !DILocation(line: 117, column: 31, scope: !161)
!172 = !DILocation(line: 117, column: 9, scope: !161)
!173 = distinct !{!173, !163, !174, !64}
!174 = !DILocation(line: 120, column: 9, scope: !158)
!175 = !DILocation(line: 121, column: 9, scope: !149)
!176 = !DILocation(line: 121, column: 21, scope: !149)
!177 = !DILocation(line: 122, column: 20, scope: !149)
!178 = !DILocation(line: 122, column: 9, scope: !149)
!179 = !DILocation(line: 124, column: 1, scope: !137)
