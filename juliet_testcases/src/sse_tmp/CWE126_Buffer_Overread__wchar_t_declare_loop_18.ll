; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !32
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  br label %source, !dbg !39

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !40), !dbg !41
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay4, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !54
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx7, align 4, !dbg !56
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !58
  store i64 %call9, i64* %destLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %source
  %0 = load i64, i64* %i, align 8, !dbg !63
  %1 = load i64, i64* %destLen, align 8, !dbg !65
  %cmp = icmp ult i64 %0, %1, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !68
  %3 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !68
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !68
  %5 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !72
  store i32 %4, i32* %arrayidx11, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %6, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx12, align 4, !dbg !81
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !82
  call void @printWLine(i32* %arraydecay13), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_18_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
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
  %call = call i64 @time(i64* null) #5, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #5, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_18_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_18_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !115
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !116
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx3, align 4, !dbg !122
  br label %source, !dbg !123

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !124), !dbg !125
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  store i32* %arraydecay4, i32** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !136
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx7, align 4, !dbg !138
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !140
  store i64 %call9, i64* %destLen, align 8, !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %source
  %0 = load i64, i64* %i, align 8, !dbg !145
  %1 = load i64, i64* %destLen, align 8, !dbg !147
  %cmp = icmp ult i64 %0, %1, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !150
  %3 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !150
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !150
  %5 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !154
  store i32 %4, i32* %arrayidx11, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %6, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !161
  store i32 0, i32* %arrayidx12, align 4, !dbg !162
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  call void @printWLine(i32* %arraydecay13), !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
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
!31 = !DILocation(line: 28, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 5, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 29, column: 25, scope: !11)
!35 = !DILocation(line: 30, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 27, scope: !11)
!39 = !DILocation(line: 32, column: 5, scope: !11)
!40 = !DILabel(scope: !11, name: "source", file: !12, line: 33)
!41 = !DILocation(line: 33, column: 1, scope: !11)
!42 = !DILocation(line: 35, column: 12, scope: !11)
!43 = !DILocation(line: 35, column: 10, scope: !11)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 37, type: !46)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 37, column: 16, scope: !45)
!49 = !DILocalVariable(name: "destLen", scope: !45, file: !12, line: 37, type: !46)
!50 = !DILocation(line: 37, column: 19, scope: !45)
!51 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 38, type: !27)
!52 = !DILocation(line: 38, column: 17, scope: !45)
!53 = !DILocation(line: 39, column: 17, scope: !45)
!54 = !DILocation(line: 39, column: 9, scope: !45)
!55 = !DILocation(line: 40, column: 9, scope: !45)
!56 = !DILocation(line: 40, column: 21, scope: !45)
!57 = !DILocation(line: 41, column: 26, scope: !45)
!58 = !DILocation(line: 41, column: 19, scope: !45)
!59 = !DILocation(line: 41, column: 17, scope: !45)
!60 = !DILocation(line: 44, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !45, file: !12, line: 44, column: 9)
!62 = !DILocation(line: 44, column: 14, scope: !61)
!63 = !DILocation(line: 44, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !12, line: 44, column: 9)
!65 = !DILocation(line: 44, column: 25, scope: !64)
!66 = !DILocation(line: 44, column: 23, scope: !64)
!67 = !DILocation(line: 44, column: 9, scope: !61)
!68 = !DILocation(line: 46, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !12, line: 45, column: 9)
!70 = !DILocation(line: 46, column: 28, scope: !69)
!71 = !DILocation(line: 46, column: 18, scope: !69)
!72 = !DILocation(line: 46, column: 13, scope: !69)
!73 = !DILocation(line: 46, column: 21, scope: !69)
!74 = !DILocation(line: 47, column: 9, scope: !69)
!75 = !DILocation(line: 44, column: 35, scope: !64)
!76 = !DILocation(line: 44, column: 9, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 47, column: 9, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 48, column: 9, scope: !45)
!81 = !DILocation(line: 48, column: 21, scope: !45)
!82 = !DILocation(line: 49, column: 20, scope: !45)
!83 = !DILocation(line: 49, column: 9, scope: !45)
!84 = !DILocation(line: 51, column: 1, scope: !11)
!85 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_18_good", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 90, column: 5, scope: !85)
!87 = !DILocation(line: 91, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !89, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!19, !19, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !12, line: 103, type: !19)
!95 = !DILocation(line: 103, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !12, line: 103, type: !91)
!97 = !DILocation(line: 103, column: 27, scope: !88)
!98 = !DILocation(line: 106, column: 22, scope: !88)
!99 = !DILocation(line: 106, column: 12, scope: !88)
!100 = !DILocation(line: 106, column: 5, scope: !88)
!101 = !DILocation(line: 108, column: 5, scope: !88)
!102 = !DILocation(line: 109, column: 5, scope: !88)
!103 = !DILocation(line: 110, column: 5, scope: !88)
!104 = !DILocation(line: 113, column: 5, scope: !88)
!105 = !DILocation(line: 114, column: 5, scope: !88)
!106 = !DILocation(line: 115, column: 5, scope: !88)
!107 = !DILocation(line: 117, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 60, type: !16)
!110 = !DILocation(line: 60, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !12, line: 61, type: !22)
!112 = !DILocation(line: 61, column: 13, scope: !108)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !12, line: 62, type: !27)
!114 = !DILocation(line: 62, column: 13, scope: !108)
!115 = !DILocation(line: 63, column: 13, scope: !108)
!116 = !DILocation(line: 63, column: 5, scope: !108)
!117 = !DILocation(line: 64, column: 5, scope: !108)
!118 = !DILocation(line: 64, column: 25, scope: !108)
!119 = !DILocation(line: 65, column: 13, scope: !108)
!120 = !DILocation(line: 65, column: 5, scope: !108)
!121 = !DILocation(line: 66, column: 5, scope: !108)
!122 = !DILocation(line: 66, column: 27, scope: !108)
!123 = !DILocation(line: 67, column: 5, scope: !108)
!124 = !DILabel(scope: !108, name: "source", file: !12, line: 68)
!125 = !DILocation(line: 68, column: 1, scope: !108)
!126 = !DILocation(line: 70, column: 12, scope: !108)
!127 = !DILocation(line: 70, column: 10, scope: !108)
!128 = !DILocalVariable(name: "i", scope: !129, file: !12, line: 72, type: !46)
!129 = distinct !DILexicalBlock(scope: !108, file: !12, line: 71, column: 5)
!130 = !DILocation(line: 72, column: 16, scope: !129)
!131 = !DILocalVariable(name: "destLen", scope: !129, file: !12, line: 72, type: !46)
!132 = !DILocation(line: 72, column: 19, scope: !129)
!133 = !DILocalVariable(name: "dest", scope: !129, file: !12, line: 73, type: !27)
!134 = !DILocation(line: 73, column: 17, scope: !129)
!135 = !DILocation(line: 74, column: 17, scope: !129)
!136 = !DILocation(line: 74, column: 9, scope: !129)
!137 = !DILocation(line: 75, column: 9, scope: !129)
!138 = !DILocation(line: 75, column: 21, scope: !129)
!139 = !DILocation(line: 76, column: 26, scope: !129)
!140 = !DILocation(line: 76, column: 19, scope: !129)
!141 = !DILocation(line: 76, column: 17, scope: !129)
!142 = !DILocation(line: 79, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !129, file: !12, line: 79, column: 9)
!144 = !DILocation(line: 79, column: 14, scope: !143)
!145 = !DILocation(line: 79, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 79, column: 9)
!147 = !DILocation(line: 79, column: 25, scope: !146)
!148 = !DILocation(line: 79, column: 23, scope: !146)
!149 = !DILocation(line: 79, column: 9, scope: !143)
!150 = !DILocation(line: 81, column: 23, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !12, line: 80, column: 9)
!152 = !DILocation(line: 81, column: 28, scope: !151)
!153 = !DILocation(line: 81, column: 18, scope: !151)
!154 = !DILocation(line: 81, column: 13, scope: !151)
!155 = !DILocation(line: 81, column: 21, scope: !151)
!156 = !DILocation(line: 82, column: 9, scope: !151)
!157 = !DILocation(line: 79, column: 35, scope: !146)
!158 = !DILocation(line: 79, column: 9, scope: !146)
!159 = distinct !{!159, !149, !160, !79}
!160 = !DILocation(line: 82, column: 9, scope: !143)
!161 = !DILocation(line: 83, column: 9, scope: !129)
!162 = !DILocation(line: 83, column: 21, scope: !129)
!163 = !DILocation(line: 84, column: 20, scope: !129)
!164 = !DILocation(line: 84, column: 9, scope: !129)
!165 = !DILocation(line: 86, column: 1, scope: !108)
