; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_01_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %8, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !52
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx4, align 4, !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !56
  store i64 %call6, i64* %destLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !61
  %10 = load i64, i64* %destLen, align 8, !dbg !63
  %cmp = icmp ult i64 %9, %10, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !66
  %12 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !66
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !66
  %14 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !70
  store i32 %13, i32* %arrayidx8, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %15, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx9, align 4, !dbg !79
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !80
  call void @printWLine(i32* %arraydecay10), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_01_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
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
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_01_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_01_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 200, align 16, !dbg !111
  %1 = bitcast i8* %0 to i32*, !dbg !112
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %2 = alloca i8, i64 400, align 16, !dbg !115
  %3 = bitcast i8* %2 to i32*, !dbg !116
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !114
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !117
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !118
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !121
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !122
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !123
  store i32 0, i32* %arrayidx2, align 4, !dbg !124
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !125
  store i32* %8, i32** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !135
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx4, align 4, !dbg !137
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !138
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !139
  store i64 %call6, i64* %destLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !144
  %10 = load i64, i64* %destLen, align 8, !dbg !146
  %cmp = icmp ult i64 %9, %10, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !149
  %12 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !149
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !149
  %14 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !153
  store i32 %13, i32* %arrayidx8, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %15, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx9, align 4, !dbg !161
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !162
  call void @printWLine(i32* %arraydecay10), !dbg !163
  ret void, !dbg !164
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_01_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 33, column: 12, scope: !15)
!38 = !DILocation(line: 33, column: 10, scope: !15)
!39 = !DILocalVariable(name: "i", scope: !40, file: !16, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 35, column: 16, scope: !40)
!44 = !DILocalVariable(name: "destLen", scope: !40, file: !16, line: 35, type: !41)
!45 = !DILocation(line: 35, column: 19, scope: !40)
!46 = !DILocalVariable(name: "dest", scope: !40, file: !16, line: 36, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 36, column: 17, scope: !40)
!51 = !DILocation(line: 37, column: 17, scope: !40)
!52 = !DILocation(line: 37, column: 9, scope: !40)
!53 = !DILocation(line: 38, column: 9, scope: !40)
!54 = !DILocation(line: 38, column: 21, scope: !40)
!55 = !DILocation(line: 39, column: 26, scope: !40)
!56 = !DILocation(line: 39, column: 19, scope: !40)
!57 = !DILocation(line: 39, column: 17, scope: !40)
!58 = !DILocation(line: 42, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !40, file: !16, line: 42, column: 9)
!60 = !DILocation(line: 42, column: 14, scope: !59)
!61 = !DILocation(line: 42, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !16, line: 42, column: 9)
!63 = !DILocation(line: 42, column: 25, scope: !62)
!64 = !DILocation(line: 42, column: 23, scope: !62)
!65 = !DILocation(line: 42, column: 9, scope: !59)
!66 = !DILocation(line: 44, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !16, line: 43, column: 9)
!68 = !DILocation(line: 44, column: 28, scope: !67)
!69 = !DILocation(line: 44, column: 18, scope: !67)
!70 = !DILocation(line: 44, column: 13, scope: !67)
!71 = !DILocation(line: 44, column: 21, scope: !67)
!72 = !DILocation(line: 45, column: 9, scope: !67)
!73 = !DILocation(line: 42, column: 35, scope: !62)
!74 = !DILocation(line: 42, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 45, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 46, column: 9, scope: !40)
!79 = !DILocation(line: 46, column: 21, scope: !40)
!80 = !DILocation(line: 47, column: 20, scope: !40)
!81 = !DILocation(line: 47, column: 9, scope: !40)
!82 = !DILocation(line: 49, column: 1, scope: !15)
!83 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_01_good", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 86, column: 5, scope: !83)
!85 = !DILocation(line: 87, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 99, type: !87, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!7, !7, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !16, line: 99, type: !7)
!93 = !DILocation(line: 99, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !16, line: 99, type: !89)
!95 = !DILocation(line: 99, column: 27, scope: !86)
!96 = !DILocation(line: 102, column: 22, scope: !86)
!97 = !DILocation(line: 102, column: 12, scope: !86)
!98 = !DILocation(line: 102, column: 5, scope: !86)
!99 = !DILocation(line: 104, column: 5, scope: !86)
!100 = !DILocation(line: 105, column: 5, scope: !86)
!101 = !DILocation(line: 106, column: 5, scope: !86)
!102 = !DILocation(line: 109, column: 5, scope: !86)
!103 = !DILocation(line: 110, column: 5, scope: !86)
!104 = !DILocation(line: 111, column: 5, scope: !86)
!105 = !DILocation(line: 113, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !16, line: 58, type: !4)
!108 = !DILocation(line: 58, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !16, line: 59, type: !4)
!110 = !DILocation(line: 59, column: 15, scope: !106)
!111 = !DILocation(line: 59, column: 42, scope: !106)
!112 = !DILocation(line: 59, column: 31, scope: !106)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !16, line: 60, type: !4)
!114 = !DILocation(line: 60, column: 15, scope: !106)
!115 = !DILocation(line: 60, column: 43, scope: !106)
!116 = !DILocation(line: 60, column: 32, scope: !106)
!117 = !DILocation(line: 61, column: 13, scope: !106)
!118 = !DILocation(line: 61, column: 5, scope: !106)
!119 = !DILocation(line: 62, column: 5, scope: !106)
!120 = !DILocation(line: 62, column: 25, scope: !106)
!121 = !DILocation(line: 63, column: 13, scope: !106)
!122 = !DILocation(line: 63, column: 5, scope: !106)
!123 = !DILocation(line: 64, column: 5, scope: !106)
!124 = !DILocation(line: 64, column: 27, scope: !106)
!125 = !DILocation(line: 66, column: 12, scope: !106)
!126 = !DILocation(line: 66, column: 10, scope: !106)
!127 = !DILocalVariable(name: "i", scope: !128, file: !16, line: 68, type: !41)
!128 = distinct !DILexicalBlock(scope: !106, file: !16, line: 67, column: 5)
!129 = !DILocation(line: 68, column: 16, scope: !128)
!130 = !DILocalVariable(name: "destLen", scope: !128, file: !16, line: 68, type: !41)
!131 = !DILocation(line: 68, column: 19, scope: !128)
!132 = !DILocalVariable(name: "dest", scope: !128, file: !16, line: 69, type: !47)
!133 = !DILocation(line: 69, column: 17, scope: !128)
!134 = !DILocation(line: 70, column: 17, scope: !128)
!135 = !DILocation(line: 70, column: 9, scope: !128)
!136 = !DILocation(line: 71, column: 9, scope: !128)
!137 = !DILocation(line: 71, column: 21, scope: !128)
!138 = !DILocation(line: 72, column: 26, scope: !128)
!139 = !DILocation(line: 72, column: 19, scope: !128)
!140 = !DILocation(line: 72, column: 17, scope: !128)
!141 = !DILocation(line: 75, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !128, file: !16, line: 75, column: 9)
!143 = !DILocation(line: 75, column: 14, scope: !142)
!144 = !DILocation(line: 75, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !16, line: 75, column: 9)
!146 = !DILocation(line: 75, column: 25, scope: !145)
!147 = !DILocation(line: 75, column: 23, scope: !145)
!148 = !DILocation(line: 75, column: 9, scope: !142)
!149 = !DILocation(line: 77, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !16, line: 76, column: 9)
!151 = !DILocation(line: 77, column: 28, scope: !150)
!152 = !DILocation(line: 77, column: 18, scope: !150)
!153 = !DILocation(line: 77, column: 13, scope: !150)
!154 = !DILocation(line: 77, column: 21, scope: !150)
!155 = !DILocation(line: 78, column: 9, scope: !150)
!156 = !DILocation(line: 75, column: 35, scope: !145)
!157 = !DILocation(line: 75, column: 9, scope: !145)
!158 = distinct !{!158, !148, !159, !77}
!159 = !DILocation(line: 78, column: 9, scope: !142)
!160 = !DILocation(line: 79, column: 9, scope: !128)
!161 = !DILocation(line: 79, column: 21, scope: !128)
!162 = !DILocation(line: 80, column: 20, scope: !128)
!163 = !DILocation(line: 80, column: 9, scope: !128)
!164 = !DILocation(line: 82, column: 1, scope: !106)
