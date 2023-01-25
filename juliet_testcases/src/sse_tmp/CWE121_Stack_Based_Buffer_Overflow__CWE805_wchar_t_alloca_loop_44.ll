; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %7 = load i32*, i32** %data, align 8, !dbg !39
  call void %6(i32* %7), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !61
  %cmp = icmp ult i64 %0, 100, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !67
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !67
  %3 = load i32*, i32** %data.addr, align 8, !dbg !68
  %4 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !68
  store i32 %2, i32* %arrayidx2, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %5, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !77
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !77
  store i32 0, i32* %arrayidx3, align 4, !dbg !78
  %7 = load i32*, i32** %data.addr, align 8, !dbg !79
  call void @printWLine(i32* %7), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #4, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #4, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !108, metadata !DIExpression()), !dbg !109
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 200, align 16, !dbg !112
  %1 = bitcast i8* %0 to i32*, !dbg !113
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = alloca i8, i64 400, align 16, !dbg !116
  %3 = bitcast i8* %2 to i32*, !dbg !117
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !115
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !118
  store i32* %4, i32** %data, align 8, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !122
  %7 = load i32*, i32** %data, align 8, !dbg !123
  call void %6(i32* %7), !dbg !122
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !125 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !134
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !140
  %cmp = icmp ult i64 %0, 100, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !146
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !146
  %3 = load i32*, i32** %data.addr, align 8, !dbg !147
  %4 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !147
  store i32 %2, i32* %arrayidx2, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %5, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !155
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !155
  store i32 0, i32* %arrayidx3, align 4, !dbg !156
  %7 = load i32*, i32** %data.addr, align 8, !dbg !157
  call void @printWLine(i32* %7), !dbg !158
  ret void, !dbg !159
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44_bad", scope: !16, file: !16, line: 40, type: !17, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 42, type: !4)
!20 = !DILocation(line: 42, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 44, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 44, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 45, type: !4)
!27 = !DILocation(line: 45, column: 15, scope: !15)
!28 = !DILocation(line: 45, column: 42, scope: !15)
!29 = !DILocation(line: 45, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 46, type: !4)
!31 = !DILocation(line: 46, column: 15, scope: !15)
!32 = !DILocation(line: 46, column: 43, scope: !15)
!33 = !DILocation(line: 46, column: 32, scope: !15)
!34 = !DILocation(line: 49, column: 12, scope: !15)
!35 = !DILocation(line: 49, column: 10, scope: !15)
!36 = !DILocation(line: 50, column: 5, scope: !15)
!37 = !DILocation(line: 50, column: 13, scope: !15)
!38 = !DILocation(line: 52, column: 5, scope: !15)
!39 = !DILocation(line: 52, column: 13, scope: !15)
!40 = !DILocation(line: 53, column: 1, scope: !15)
!41 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !16, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 31, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !16, line: 26, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !16, line: 25, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 26, column: 16, scope: !45)
!49 = !DILocalVariable(name: "source", scope: !45, file: !16, line: 27, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 27, column: 17, scope: !45)
!54 = !DILocation(line: 28, column: 17, scope: !45)
!55 = !DILocation(line: 28, column: 9, scope: !45)
!56 = !DILocation(line: 29, column: 9, scope: !45)
!57 = !DILocation(line: 29, column: 23, scope: !45)
!58 = !DILocation(line: 31, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !45, file: !16, line: 31, column: 9)
!60 = !DILocation(line: 31, column: 14, scope: !59)
!61 = !DILocation(line: 31, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !16, line: 31, column: 9)
!63 = !DILocation(line: 31, column: 23, scope: !62)
!64 = !DILocation(line: 31, column: 9, scope: !59)
!65 = !DILocation(line: 33, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !16, line: 32, column: 9)
!67 = !DILocation(line: 33, column: 23, scope: !66)
!68 = !DILocation(line: 33, column: 13, scope: !66)
!69 = !DILocation(line: 33, column: 18, scope: !66)
!70 = !DILocation(line: 33, column: 21, scope: !66)
!71 = !DILocation(line: 34, column: 9, scope: !66)
!72 = !DILocation(line: 31, column: 31, scope: !62)
!73 = !DILocation(line: 31, column: 9, scope: !62)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 34, column: 9, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 35, column: 9, scope: !45)
!78 = !DILocation(line: 35, column: 21, scope: !45)
!79 = !DILocation(line: 36, column: 20, scope: !45)
!80 = !DILocation(line: 36, column: 9, scope: !45)
!81 = !DILocation(line: 38, column: 1, scope: !41)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_44_good", scope: !16, file: !16, line: 89, type: !17, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 91, column: 5, scope: !82)
!84 = !DILocation(line: 92, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 103, type: !86, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!7, !7, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !16, line: 103, type: !7)
!92 = !DILocation(line: 103, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !16, line: 103, type: !88)
!94 = !DILocation(line: 103, column: 27, scope: !85)
!95 = !DILocation(line: 106, column: 22, scope: !85)
!96 = !DILocation(line: 106, column: 12, scope: !85)
!97 = !DILocation(line: 106, column: 5, scope: !85)
!98 = !DILocation(line: 108, column: 5, scope: !85)
!99 = !DILocation(line: 109, column: 5, scope: !85)
!100 = !DILocation(line: 110, column: 5, scope: !85)
!101 = !DILocation(line: 113, column: 5, scope: !85)
!102 = !DILocation(line: 114, column: 5, scope: !85)
!103 = !DILocation(line: 115, column: 5, scope: !85)
!104 = !DILocation(line: 117, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !16, line: 79, type: !4)
!107 = !DILocation(line: 79, column: 15, scope: !105)
!108 = !DILocalVariable(name: "funcPtr", scope: !105, file: !16, line: 80, type: !22)
!109 = !DILocation(line: 80, column: 12, scope: !105)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !16, line: 81, type: !4)
!111 = !DILocation(line: 81, column: 15, scope: !105)
!112 = !DILocation(line: 81, column: 42, scope: !105)
!113 = !DILocation(line: 81, column: 31, scope: !105)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !16, line: 82, type: !4)
!115 = !DILocation(line: 82, column: 15, scope: !105)
!116 = !DILocation(line: 82, column: 43, scope: !105)
!117 = !DILocation(line: 82, column: 32, scope: !105)
!118 = !DILocation(line: 84, column: 12, scope: !105)
!119 = !DILocation(line: 84, column: 10, scope: !105)
!120 = !DILocation(line: 85, column: 5, scope: !105)
!121 = !DILocation(line: 85, column: 13, scope: !105)
!122 = !DILocation(line: 86, column: 5, scope: !105)
!123 = !DILocation(line: 86, column: 13, scope: !105)
!124 = !DILocation(line: 87, column: 1, scope: !105)
!125 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 60, type: !23, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", arg: 1, scope: !125, file: !16, line: 60, type: !4)
!127 = !DILocation(line: 60, column: 35, scope: !125)
!128 = !DILocalVariable(name: "i", scope: !129, file: !16, line: 63, type: !46)
!129 = distinct !DILexicalBlock(scope: !125, file: !16, line: 62, column: 5)
!130 = !DILocation(line: 63, column: 16, scope: !129)
!131 = !DILocalVariable(name: "source", scope: !129, file: !16, line: 64, type: !50)
!132 = !DILocation(line: 64, column: 17, scope: !129)
!133 = !DILocation(line: 65, column: 17, scope: !129)
!134 = !DILocation(line: 65, column: 9, scope: !129)
!135 = !DILocation(line: 66, column: 9, scope: !129)
!136 = !DILocation(line: 66, column: 23, scope: !129)
!137 = !DILocation(line: 68, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !129, file: !16, line: 68, column: 9)
!139 = !DILocation(line: 68, column: 14, scope: !138)
!140 = !DILocation(line: 68, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !16, line: 68, column: 9)
!142 = !DILocation(line: 68, column: 23, scope: !141)
!143 = !DILocation(line: 68, column: 9, scope: !138)
!144 = !DILocation(line: 70, column: 30, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !16, line: 69, column: 9)
!146 = !DILocation(line: 70, column: 23, scope: !145)
!147 = !DILocation(line: 70, column: 13, scope: !145)
!148 = !DILocation(line: 70, column: 18, scope: !145)
!149 = !DILocation(line: 70, column: 21, scope: !145)
!150 = !DILocation(line: 71, column: 9, scope: !145)
!151 = !DILocation(line: 68, column: 31, scope: !141)
!152 = !DILocation(line: 68, column: 9, scope: !141)
!153 = distinct !{!153, !143, !154, !76}
!154 = !DILocation(line: 71, column: 9, scope: !138)
!155 = !DILocation(line: 72, column: 9, scope: !129)
!156 = !DILocation(line: 72, column: 21, scope: !129)
!157 = !DILocation(line: 73, column: 20, scope: !129)
!158 = !DILocation(line: 73, column: 9, scope: !129)
!159 = !DILocation(line: 75, column: 1, scope: !125)
