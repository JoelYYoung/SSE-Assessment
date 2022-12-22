; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !37
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !40
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !41
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx3, align 4, !dbg !43
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !44
  store i32* %arraydecay4, i32** %data, align 8, !dbg !45
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !46
  %1 = load i32*, i32** %data, align 8, !dbg !47
  call void %0(i32* %1), !dbg !46
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !59, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !62
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx, align 4, !dbg !64
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !66
  store i64 %call2, i64* %destLen, align 8, !dbg !67
  store i64 0, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !71
  %1 = load i64, i64* %destLen, align 8, !dbg !73
  %cmp = icmp ult i64 %0, %1, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !76
  %3 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !76
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !76
  %5 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !80
  store i32 %4, i32* %arrayidx4, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %6, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx5, align 4, !dbg !89
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  call void @printWLine(i32* %arraydecay6), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_44_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #5, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #5, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_44_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_44_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !119, metadata !DIExpression()), !dbg !120
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !125
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !126
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !129
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !130
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx3, align 4, !dbg !132
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !133
  store i32* %arraydecay4, i32** %data, align 8, !dbg !134
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !135
  %1 = load i32*, i32** %data, align 8, !dbg !136
  call void %0(i32* %1), !dbg !135
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !138 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !149
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !153
  store i64 %call2, i64* %destLen, align 8, !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !158
  %1 = load i64, i64* %destLen, align 8, !dbg !160
  %cmp = icmp ult i64 %0, %1, !dbg !161
  br i1 %cmp, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !163
  %3 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !163
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !163
  %5 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !167
  store i32 %4, i32* %arrayidx4, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %6, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !174
  store i32 0, i32* %arrayidx5, align 4, !dbg !175
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !176
  call void @printWLine(i32* %arraydecay6), !dbg !177
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_44_bad", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 44, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 44, column: 15, scope: !11)
!21 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 46, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !16}
!25 = !DILocation(line: 46, column: 12, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 47, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 47, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 48, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 48, column: 13, scope: !11)
!36 = !DILocation(line: 49, column: 13, scope: !11)
!37 = !DILocation(line: 49, column: 5, scope: !11)
!38 = !DILocation(line: 50, column: 5, scope: !11)
!39 = !DILocation(line: 50, column: 25, scope: !11)
!40 = !DILocation(line: 51, column: 13, scope: !11)
!41 = !DILocation(line: 51, column: 5, scope: !11)
!42 = !DILocation(line: 52, column: 5, scope: !11)
!43 = !DILocation(line: 52, column: 27, scope: !11)
!44 = !DILocation(line: 54, column: 12, scope: !11)
!45 = !DILocation(line: 54, column: 10, scope: !11)
!46 = !DILocation(line: 56, column: 5, scope: !11)
!47 = !DILocation(line: 56, column: 13, scope: !11)
!48 = !DILocation(line: 57, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !12, line: 23, type: !16)
!51 = !DILocation(line: 23, column: 31, scope: !49)
!52 = !DILocalVariable(name: "i", scope: !53, file: !12, line: 26, type: !54)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 25, column: 5)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 26, column: 16, scope: !53)
!57 = !DILocalVariable(name: "destLen", scope: !53, file: !12, line: 26, type: !54)
!58 = !DILocation(line: 26, column: 19, scope: !53)
!59 = !DILocalVariable(name: "dest", scope: !53, file: !12, line: 27, type: !32)
!60 = !DILocation(line: 27, column: 17, scope: !53)
!61 = !DILocation(line: 28, column: 17, scope: !53)
!62 = !DILocation(line: 28, column: 9, scope: !53)
!63 = !DILocation(line: 29, column: 9, scope: !53)
!64 = !DILocation(line: 29, column: 21, scope: !53)
!65 = !DILocation(line: 30, column: 26, scope: !53)
!66 = !DILocation(line: 30, column: 19, scope: !53)
!67 = !DILocation(line: 30, column: 17, scope: !53)
!68 = !DILocation(line: 33, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !53, file: !12, line: 33, column: 9)
!70 = !DILocation(line: 33, column: 14, scope: !69)
!71 = !DILocation(line: 33, column: 21, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !12, line: 33, column: 9)
!73 = !DILocation(line: 33, column: 25, scope: !72)
!74 = !DILocation(line: 33, column: 23, scope: !72)
!75 = !DILocation(line: 33, column: 9, scope: !69)
!76 = !DILocation(line: 35, column: 23, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !12, line: 34, column: 9)
!78 = !DILocation(line: 35, column: 28, scope: !77)
!79 = !DILocation(line: 35, column: 18, scope: !77)
!80 = !DILocation(line: 35, column: 13, scope: !77)
!81 = !DILocation(line: 35, column: 21, scope: !77)
!82 = !DILocation(line: 36, column: 9, scope: !77)
!83 = !DILocation(line: 33, column: 35, scope: !72)
!84 = !DILocation(line: 33, column: 9, scope: !72)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 36, column: 9, scope: !69)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 37, column: 9, scope: !53)
!89 = !DILocation(line: 37, column: 21, scope: !53)
!90 = !DILocation(line: 38, column: 20, scope: !53)
!91 = !DILocation(line: 38, column: 9, scope: !53)
!92 = !DILocation(line: 40, column: 1, scope: !49)
!93 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_44_good", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 100, column: 5, scope: !93)
!95 = !DILocation(line: 101, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 112, type: !97, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!19, !19, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !12, line: 112, type: !19)
!103 = !DILocation(line: 112, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !12, line: 112, type: !99)
!105 = !DILocation(line: 112, column: 27, scope: !96)
!106 = !DILocation(line: 115, column: 22, scope: !96)
!107 = !DILocation(line: 115, column: 12, scope: !96)
!108 = !DILocation(line: 115, column: 5, scope: !96)
!109 = !DILocation(line: 117, column: 5, scope: !96)
!110 = !DILocation(line: 118, column: 5, scope: !96)
!111 = !DILocation(line: 119, column: 5, scope: !96)
!112 = !DILocation(line: 122, column: 5, scope: !96)
!113 = !DILocation(line: 123, column: 5, scope: !96)
!114 = !DILocation(line: 124, column: 5, scope: !96)
!115 = !DILocation(line: 126, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 85, type: !16)
!118 = !DILocation(line: 85, column: 15, scope: !116)
!119 = !DILocalVariable(name: "funcPtr", scope: !116, file: !12, line: 86, type: !22)
!120 = !DILocation(line: 86, column: 12, scope: !116)
!121 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !12, line: 87, type: !27)
!122 = !DILocation(line: 87, column: 13, scope: !116)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !12, line: 88, type: !32)
!124 = !DILocation(line: 88, column: 13, scope: !116)
!125 = !DILocation(line: 89, column: 13, scope: !116)
!126 = !DILocation(line: 89, column: 5, scope: !116)
!127 = !DILocation(line: 90, column: 5, scope: !116)
!128 = !DILocation(line: 90, column: 25, scope: !116)
!129 = !DILocation(line: 91, column: 13, scope: !116)
!130 = !DILocation(line: 91, column: 5, scope: !116)
!131 = !DILocation(line: 92, column: 5, scope: !116)
!132 = !DILocation(line: 92, column: 27, scope: !116)
!133 = !DILocation(line: 94, column: 12, scope: !116)
!134 = !DILocation(line: 94, column: 10, scope: !116)
!135 = !DILocation(line: 95, column: 5, scope: !116)
!136 = !DILocation(line: 95, column: 13, scope: !116)
!137 = !DILocation(line: 96, column: 1, scope: !116)
!138 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 64, type: !23, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", arg: 1, scope: !138, file: !12, line: 64, type: !16)
!140 = !DILocation(line: 64, column: 35, scope: !138)
!141 = !DILocalVariable(name: "i", scope: !142, file: !12, line: 67, type: !54)
!142 = distinct !DILexicalBlock(scope: !138, file: !12, line: 66, column: 5)
!143 = !DILocation(line: 67, column: 16, scope: !142)
!144 = !DILocalVariable(name: "destLen", scope: !142, file: !12, line: 67, type: !54)
!145 = !DILocation(line: 67, column: 19, scope: !142)
!146 = !DILocalVariable(name: "dest", scope: !142, file: !12, line: 68, type: !32)
!147 = !DILocation(line: 68, column: 17, scope: !142)
!148 = !DILocation(line: 69, column: 17, scope: !142)
!149 = !DILocation(line: 69, column: 9, scope: !142)
!150 = !DILocation(line: 70, column: 9, scope: !142)
!151 = !DILocation(line: 70, column: 21, scope: !142)
!152 = !DILocation(line: 71, column: 26, scope: !142)
!153 = !DILocation(line: 71, column: 19, scope: !142)
!154 = !DILocation(line: 71, column: 17, scope: !142)
!155 = !DILocation(line: 74, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !142, file: !12, line: 74, column: 9)
!157 = !DILocation(line: 74, column: 14, scope: !156)
!158 = !DILocation(line: 74, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !12, line: 74, column: 9)
!160 = !DILocation(line: 74, column: 25, scope: !159)
!161 = !DILocation(line: 74, column: 23, scope: !159)
!162 = !DILocation(line: 74, column: 9, scope: !156)
!163 = !DILocation(line: 76, column: 23, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !12, line: 75, column: 9)
!165 = !DILocation(line: 76, column: 28, scope: !164)
!166 = !DILocation(line: 76, column: 18, scope: !164)
!167 = !DILocation(line: 76, column: 13, scope: !164)
!168 = !DILocation(line: 76, column: 21, scope: !164)
!169 = !DILocation(line: 77, column: 9, scope: !164)
!170 = !DILocation(line: 74, column: 35, scope: !159)
!171 = !DILocation(line: 74, column: 9, scope: !159)
!172 = distinct !{!172, !162, !173, !87}
!173 = !DILocation(line: 77, column: 9, scope: !156)
!174 = !DILocation(line: 78, column: 9, scope: !142)
!175 = !DILocation(line: 78, column: 21, scope: !142)
!176 = !DILocation(line: 79, column: 20, scope: !142)
!177 = !DILocation(line: 79, column: 9, scope: !142)
!178 = !DILocation(line: 81, column: 1, scope: !138)
