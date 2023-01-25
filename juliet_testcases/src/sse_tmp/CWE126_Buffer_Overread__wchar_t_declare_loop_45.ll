; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__wchar_t_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__wchar_t_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
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
  %0 = load i32*, i32** %data, align 8, !dbg !46
  store i32* %0, i32** @CWE126_Buffer_Overread__wchar_t_declare_loop_45_badData, align 8, !dbg !47
  call void @badSink(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_45_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_45_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_45_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_declare_loop_45_badData, align 8, !dbg !76
  store i32* %0, i32** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !86
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !87
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !91
  store i64 %call2, i64* %destLen, align 8, !dbg !92
  store i64 0, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !96
  %2 = load i64, i64* %destLen, align 8, !dbg !98
  %cmp = icmp ult i64 %1, %2, !dbg !99
  br i1 %cmp, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %4 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !101
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !101
  %6 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !105
  store i32 %5, i32* %arrayidx4, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %7, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx5, align 4, !dbg !114
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  call void @printWLine(i32* %arraydecay6), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
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
  %0 = load i32*, i32** %data, align 8, !dbg !135
  store i32* %0, i32** @CWE126_Buffer_Overread__wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !136
  call void @goodG2BSink(), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  %0 = load i32*, i32** @CWE126_Buffer_Overread__wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !142
  store i32* %0, i32** %data, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !148, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !151
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !154
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !155
  store i64 %call2, i64* %destLen, align 8, !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !160
  %2 = load i64, i64* %destLen, align 8, !dbg !162
  %cmp = icmp ult i64 %1, %2, !dbg !163
  br i1 %cmp, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !165
  %4 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !165
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !165
  %6 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !169
  store i32 %5, i32* %arrayidx4, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %7, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !176
  store i32 0, i32* %arrayidx5, align 4, !dbg !177
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !178
  call void @printWLine(i32* %arraydecay6), !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_45_bad", scope: !10, file: !10, line: 46, type: !22, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 48, type: !11)
!25 = !DILocation(line: 48, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !10, line: 49, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 49, column: 13, scope: !21)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !10, line: 50, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 50, column: 13, scope: !21)
!36 = !DILocation(line: 51, column: 13, scope: !21)
!37 = !DILocation(line: 51, column: 5, scope: !21)
!38 = !DILocation(line: 52, column: 5, scope: !21)
!39 = !DILocation(line: 52, column: 25, scope: !21)
!40 = !DILocation(line: 53, column: 13, scope: !21)
!41 = !DILocation(line: 53, column: 5, scope: !21)
!42 = !DILocation(line: 54, column: 5, scope: !21)
!43 = !DILocation(line: 54, column: 27, scope: !21)
!44 = !DILocation(line: 56, column: 12, scope: !21)
!45 = !DILocation(line: 56, column: 10, scope: !21)
!46 = !DILocation(line: 57, column: 63, scope: !21)
!47 = !DILocation(line: 57, column: 61, scope: !21)
!48 = !DILocation(line: 58, column: 5, scope: !21)
!49 = !DILocation(line: 59, column: 1, scope: !21)
!50 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_45_good", scope: !10, file: !10, line: 101, type: !22, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 103, column: 5, scope: !50)
!52 = !DILocation(line: 104, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 115, type: !54, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!14, !14, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !10, line: 115, type: !14)
!60 = !DILocation(line: 115, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !10, line: 115, type: !56)
!62 = !DILocation(line: 115, column: 27, scope: !53)
!63 = !DILocation(line: 118, column: 22, scope: !53)
!64 = !DILocation(line: 118, column: 12, scope: !53)
!65 = !DILocation(line: 118, column: 5, scope: !53)
!66 = !DILocation(line: 120, column: 5, scope: !53)
!67 = !DILocation(line: 121, column: 5, scope: !53)
!68 = !DILocation(line: 122, column: 5, scope: !53)
!69 = !DILocation(line: 125, column: 5, scope: !53)
!70 = !DILocation(line: 126, column: 5, scope: !53)
!71 = !DILocation(line: 127, column: 5, scope: !53)
!72 = !DILocation(line: 129, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !10, line: 28, type: !11)
!75 = !DILocation(line: 28, column: 15, scope: !73)
!76 = !DILocation(line: 28, column: 22, scope: !73)
!77 = !DILocalVariable(name: "i", scope: !78, file: !10, line: 30, type: !79)
!78 = distinct !DILexicalBlock(scope: !73, file: !10, line: 29, column: 5)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 46, baseType: !80)
!80 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!81 = !DILocation(line: 30, column: 16, scope: !78)
!82 = !DILocalVariable(name: "destLen", scope: !78, file: !10, line: 30, type: !79)
!83 = !DILocation(line: 30, column: 19, scope: !78)
!84 = !DILocalVariable(name: "dest", scope: !78, file: !10, line: 31, type: !32)
!85 = !DILocation(line: 31, column: 17, scope: !78)
!86 = !DILocation(line: 32, column: 17, scope: !78)
!87 = !DILocation(line: 32, column: 9, scope: !78)
!88 = !DILocation(line: 33, column: 9, scope: !78)
!89 = !DILocation(line: 33, column: 21, scope: !78)
!90 = !DILocation(line: 34, column: 26, scope: !78)
!91 = !DILocation(line: 34, column: 19, scope: !78)
!92 = !DILocation(line: 34, column: 17, scope: !78)
!93 = !DILocation(line: 37, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !78, file: !10, line: 37, column: 9)
!95 = !DILocation(line: 37, column: 14, scope: !94)
!96 = !DILocation(line: 37, column: 21, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !10, line: 37, column: 9)
!98 = !DILocation(line: 37, column: 25, scope: !97)
!99 = !DILocation(line: 37, column: 23, scope: !97)
!100 = !DILocation(line: 37, column: 9, scope: !94)
!101 = !DILocation(line: 39, column: 23, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !10, line: 38, column: 9)
!103 = !DILocation(line: 39, column: 28, scope: !102)
!104 = !DILocation(line: 39, column: 18, scope: !102)
!105 = !DILocation(line: 39, column: 13, scope: !102)
!106 = !DILocation(line: 39, column: 21, scope: !102)
!107 = !DILocation(line: 40, column: 9, scope: !102)
!108 = !DILocation(line: 37, column: 35, scope: !97)
!109 = !DILocation(line: 37, column: 9, scope: !97)
!110 = distinct !{!110, !100, !111, !112}
!111 = !DILocation(line: 40, column: 9, scope: !94)
!112 = !{!"llvm.loop.mustprogress"}
!113 = !DILocation(line: 41, column: 9, scope: !78)
!114 = !DILocation(line: 41, column: 21, scope: !78)
!115 = !DILocation(line: 42, column: 20, scope: !78)
!116 = !DILocation(line: 42, column: 9, scope: !78)
!117 = !DILocation(line: 44, column: 1, scope: !73)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 86, type: !22, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !10, line: 88, type: !11)
!120 = !DILocation(line: 88, column: 15, scope: !118)
!121 = !DILocalVariable(name: "dataBadBuffer", scope: !118, file: !10, line: 89, type: !27)
!122 = !DILocation(line: 89, column: 13, scope: !118)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !118, file: !10, line: 90, type: !32)
!124 = !DILocation(line: 90, column: 13, scope: !118)
!125 = !DILocation(line: 91, column: 13, scope: !118)
!126 = !DILocation(line: 91, column: 5, scope: !118)
!127 = !DILocation(line: 92, column: 5, scope: !118)
!128 = !DILocation(line: 92, column: 25, scope: !118)
!129 = !DILocation(line: 93, column: 13, scope: !118)
!130 = !DILocation(line: 93, column: 5, scope: !118)
!131 = !DILocation(line: 94, column: 5, scope: !118)
!132 = !DILocation(line: 94, column: 27, scope: !118)
!133 = !DILocation(line: 96, column: 12, scope: !118)
!134 = !DILocation(line: 96, column: 10, scope: !118)
!135 = !DILocation(line: 97, column: 67, scope: !118)
!136 = !DILocation(line: 97, column: 65, scope: !118)
!137 = !DILocation(line: 98, column: 5, scope: !118)
!138 = !DILocation(line: 99, column: 1, scope: !118)
!139 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 66, type: !22, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", scope: !139, file: !10, line: 68, type: !11)
!141 = !DILocation(line: 68, column: 15, scope: !139)
!142 = !DILocation(line: 68, column: 22, scope: !139)
!143 = !DILocalVariable(name: "i", scope: !144, file: !10, line: 70, type: !79)
!144 = distinct !DILexicalBlock(scope: !139, file: !10, line: 69, column: 5)
!145 = !DILocation(line: 70, column: 16, scope: !144)
!146 = !DILocalVariable(name: "destLen", scope: !144, file: !10, line: 70, type: !79)
!147 = !DILocation(line: 70, column: 19, scope: !144)
!148 = !DILocalVariable(name: "dest", scope: !144, file: !10, line: 71, type: !32)
!149 = !DILocation(line: 71, column: 17, scope: !144)
!150 = !DILocation(line: 72, column: 17, scope: !144)
!151 = !DILocation(line: 72, column: 9, scope: !144)
!152 = !DILocation(line: 73, column: 9, scope: !144)
!153 = !DILocation(line: 73, column: 21, scope: !144)
!154 = !DILocation(line: 74, column: 26, scope: !144)
!155 = !DILocation(line: 74, column: 19, scope: !144)
!156 = !DILocation(line: 74, column: 17, scope: !144)
!157 = !DILocation(line: 77, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !144, file: !10, line: 77, column: 9)
!159 = !DILocation(line: 77, column: 14, scope: !158)
!160 = !DILocation(line: 77, column: 21, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !10, line: 77, column: 9)
!162 = !DILocation(line: 77, column: 25, scope: !161)
!163 = !DILocation(line: 77, column: 23, scope: !161)
!164 = !DILocation(line: 77, column: 9, scope: !158)
!165 = !DILocation(line: 79, column: 23, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !10, line: 78, column: 9)
!167 = !DILocation(line: 79, column: 28, scope: !166)
!168 = !DILocation(line: 79, column: 18, scope: !166)
!169 = !DILocation(line: 79, column: 13, scope: !166)
!170 = !DILocation(line: 79, column: 21, scope: !166)
!171 = !DILocation(line: 80, column: 9, scope: !166)
!172 = !DILocation(line: 77, column: 35, scope: !161)
!173 = !DILocation(line: 77, column: 9, scope: !161)
!174 = distinct !{!174, !164, !175, !112}
!175 = !DILocation(line: 80, column: 9, scope: !158)
!176 = !DILocation(line: 81, column: 9, scope: !144)
!177 = !DILocation(line: 81, column: 21, scope: !144)
!178 = !DILocation(line: 82, column: 20, scope: !144)
!179 = !DILocation(line: 82, column: 9, scope: !144)
!180 = !DILocation(line: 84, column: 1, scope: !139)
