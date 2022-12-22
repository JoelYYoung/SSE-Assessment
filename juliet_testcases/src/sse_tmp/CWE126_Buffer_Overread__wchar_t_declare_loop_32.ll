; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data4 = alloca i32*, align 8
  %data6 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
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
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !44, metadata !DIExpression()), !dbg !46
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !47
  %1 = load i32*, i32** %0, align 8, !dbg !48
  store i32* %1, i32** %data4, align 8, !dbg !46
  %arraydecay5 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !49
  store i32* %arraydecay5, i32** %data4, align 8, !dbg !50
  %2 = load i32*, i32** %data4, align 8, !dbg !51
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !52
  store i32* %2, i32** %3, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32** %data6, metadata !54, metadata !DIExpression()), !dbg !56
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !57
  %5 = load i32*, i32** %4, align 8, !dbg !58
  store i32* %5, i32** %data6, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i, metadata !59, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !66, metadata !DIExpression()), !dbg !67
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  %call8 = call i32* @wmemset(i32* %arraydecay7, i32 67, i64 99) #5, !dbg !69
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !70
  store i32 0, i32* %arrayidx9, align 4, !dbg !71
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  %call11 = call i64 @wcslen(i32* %arraydecay10) #6, !dbg !73
  store i64 %call11, i64* %destLen, align 8, !dbg !74
  store i64 0, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !78
  %7 = load i64, i64* %destLen, align 8, !dbg !80
  %cmp = icmp ult i64 %6, %7, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data6, align 8, !dbg !83
  %9 = load i64, i64* %i, align 8, !dbg !85
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !83
  %10 = load i32, i32* %arrayidx12, align 4, !dbg !83
  %11 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !87
  store i32 %10, i32* %arrayidx13, align 4, !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !90
  %inc = add i64 %12, 1, !dbg !90
  store i64 %inc, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %arrayidx14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx14, align 4, !dbg !96
  %arraydecay15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !97
  call void @printWLine(i32* %arraydecay15), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_32_good() #0 !dbg !100 {
entry:
  call void @goodG2B(), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !103 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call i64 @time(i64* null) #5, !dbg !113
  %conv = trunc i64 %call to i32, !dbg !114
  call void @srand(i32 %conv) #5, !dbg !115
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !116
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_32_good(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !119
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_32_bad(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data4 = alloca i32*, align 8
  %data6 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !126, metadata !DIExpression()), !dbg !127
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !128, metadata !DIExpression()), !dbg !129
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !134
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !135
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !138
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !139
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !140
  store i32 0, i32* %arrayidx3, align 4, !dbg !141
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !142, metadata !DIExpression()), !dbg !144
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !145
  %1 = load i32*, i32** %0, align 8, !dbg !146
  store i32* %1, i32** %data4, align 8, !dbg !144
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !147
  store i32* %arraydecay5, i32** %data4, align 8, !dbg !148
  %2 = load i32*, i32** %data4, align 8, !dbg !149
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !150
  store i32* %2, i32** %3, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata i32** %data6, metadata !152, metadata !DIExpression()), !dbg !154
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !155
  %5 = load i32*, i32** %4, align 8, !dbg !156
  store i32* %5, i32** %data6, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !162, metadata !DIExpression()), !dbg !163
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  %call8 = call i32* @wmemset(i32* %arraydecay7, i32 67, i64 99) #5, !dbg !165
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !166
  store i32 0, i32* %arrayidx9, align 4, !dbg !167
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  %call11 = call i64 @wcslen(i32* %arraydecay10) #6, !dbg !169
  store i64 %call11, i64* %destLen, align 8, !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !174
  %7 = load i64, i64* %destLen, align 8, !dbg !176
  %cmp = icmp ult i64 %6, %7, !dbg !177
  br i1 %cmp, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data6, align 8, !dbg !179
  %9 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !179
  %10 = load i32, i32* %arrayidx12, align 4, !dbg !179
  %11 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !183
  store i32 %10, i32* %arrayidx13, align 4, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %12, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %arrayidx14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !190
  store i32 0, i32* %arrayidx14, align 4, !dbg !191
  %arraydecay15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !192
  call void @printWLine(i32* %arraydecay15), !dbg !193
  ret void, !dbg !194
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 28, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 29, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 13, scope: !11)
!37 = !DILocation(line: 30, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 5, scope: !11)
!39 = !DILocation(line: 31, column: 25, scope: !11)
!40 = !DILocation(line: 32, column: 13, scope: !11)
!41 = !DILocation(line: 32, column: 5, scope: !11)
!42 = !DILocation(line: 33, column: 5, scope: !11)
!43 = !DILocation(line: 33, column: 27, scope: !11)
!44 = !DILocalVariable(name: "data", scope: !45, file: !12, line: 35, type: !16)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!46 = !DILocation(line: 35, column: 19, scope: !45)
!47 = !DILocation(line: 35, column: 27, scope: !45)
!48 = !DILocation(line: 35, column: 26, scope: !45)
!49 = !DILocation(line: 37, column: 16, scope: !45)
!50 = !DILocation(line: 37, column: 14, scope: !45)
!51 = !DILocation(line: 38, column: 21, scope: !45)
!52 = !DILocation(line: 38, column: 10, scope: !45)
!53 = !DILocation(line: 38, column: 19, scope: !45)
!54 = !DILocalVariable(name: "data", scope: !55, file: !12, line: 41, type: !16)
!55 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!56 = !DILocation(line: 41, column: 19, scope: !55)
!57 = !DILocation(line: 41, column: 27, scope: !55)
!58 = !DILocation(line: 41, column: 26, scope: !55)
!59 = !DILocalVariable(name: "i", scope: !60, file: !12, line: 43, type: !61)
!60 = distinct !DILexicalBlock(scope: !55, file: !12, line: 42, column: 9)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !62)
!62 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!63 = !DILocation(line: 43, column: 20, scope: !60)
!64 = !DILocalVariable(name: "destLen", scope: !60, file: !12, line: 43, type: !61)
!65 = !DILocation(line: 43, column: 23, scope: !60)
!66 = !DILocalVariable(name: "dest", scope: !60, file: !12, line: 44, type: !32)
!67 = !DILocation(line: 44, column: 21, scope: !60)
!68 = !DILocation(line: 45, column: 21, scope: !60)
!69 = !DILocation(line: 45, column: 13, scope: !60)
!70 = !DILocation(line: 46, column: 13, scope: !60)
!71 = !DILocation(line: 46, column: 25, scope: !60)
!72 = !DILocation(line: 47, column: 30, scope: !60)
!73 = !DILocation(line: 47, column: 23, scope: !60)
!74 = !DILocation(line: 47, column: 21, scope: !60)
!75 = !DILocation(line: 50, column: 20, scope: !76)
!76 = distinct !DILexicalBlock(scope: !60, file: !12, line: 50, column: 13)
!77 = !DILocation(line: 50, column: 18, scope: !76)
!78 = !DILocation(line: 50, column: 25, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !12, line: 50, column: 13)
!80 = !DILocation(line: 50, column: 29, scope: !79)
!81 = !DILocation(line: 50, column: 27, scope: !79)
!82 = !DILocation(line: 50, column: 13, scope: !76)
!83 = !DILocation(line: 52, column: 27, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !12, line: 51, column: 13)
!85 = !DILocation(line: 52, column: 32, scope: !84)
!86 = !DILocation(line: 52, column: 22, scope: !84)
!87 = !DILocation(line: 52, column: 17, scope: !84)
!88 = !DILocation(line: 52, column: 25, scope: !84)
!89 = !DILocation(line: 53, column: 13, scope: !84)
!90 = !DILocation(line: 50, column: 39, scope: !79)
!91 = !DILocation(line: 50, column: 13, scope: !79)
!92 = distinct !{!92, !82, !93, !94}
!93 = !DILocation(line: 53, column: 13, scope: !76)
!94 = !{!"llvm.loop.mustprogress"}
!95 = !DILocation(line: 54, column: 13, scope: !60)
!96 = !DILocation(line: 54, column: 25, scope: !60)
!97 = !DILocation(line: 55, column: 24, scope: !60)
!98 = !DILocation(line: 55, column: 13, scope: !60)
!99 = !DILocation(line: 58, column: 1, scope: !11)
!100 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_32_good", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 104, column: 5, scope: !100)
!102 = !DILocation(line: 105, column: 1, scope: !100)
!103 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 116, type: !104, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{!19, !19, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!109 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !12, line: 116, type: !19)
!110 = !DILocation(line: 116, column: 14, scope: !103)
!111 = !DILocalVariable(name: "argv", arg: 2, scope: !103, file: !12, line: 116, type: !106)
!112 = !DILocation(line: 116, column: 27, scope: !103)
!113 = !DILocation(line: 119, column: 22, scope: !103)
!114 = !DILocation(line: 119, column: 12, scope: !103)
!115 = !DILocation(line: 119, column: 5, scope: !103)
!116 = !DILocation(line: 121, column: 5, scope: !103)
!117 = !DILocation(line: 122, column: 5, scope: !103)
!118 = !DILocation(line: 123, column: 5, scope: !103)
!119 = !DILocation(line: 126, column: 5, scope: !103)
!120 = !DILocation(line: 127, column: 5, scope: !103)
!121 = !DILocation(line: 128, column: 5, scope: !103)
!122 = !DILocation(line: 130, column: 5, scope: !103)
!123 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 67, type: !16)
!125 = !DILocation(line: 67, column: 15, scope: !123)
!126 = !DILocalVariable(name: "dataPtr1", scope: !123, file: !12, line: 68, type: !22)
!127 = !DILocation(line: 68, column: 16, scope: !123)
!128 = !DILocalVariable(name: "dataPtr2", scope: !123, file: !12, line: 69, type: !22)
!129 = !DILocation(line: 69, column: 16, scope: !123)
!130 = !DILocalVariable(name: "dataBadBuffer", scope: !123, file: !12, line: 70, type: !27)
!131 = !DILocation(line: 70, column: 13, scope: !123)
!132 = !DILocalVariable(name: "dataGoodBuffer", scope: !123, file: !12, line: 71, type: !32)
!133 = !DILocation(line: 71, column: 13, scope: !123)
!134 = !DILocation(line: 72, column: 13, scope: !123)
!135 = !DILocation(line: 72, column: 5, scope: !123)
!136 = !DILocation(line: 73, column: 5, scope: !123)
!137 = !DILocation(line: 73, column: 25, scope: !123)
!138 = !DILocation(line: 74, column: 13, scope: !123)
!139 = !DILocation(line: 74, column: 5, scope: !123)
!140 = !DILocation(line: 75, column: 5, scope: !123)
!141 = !DILocation(line: 75, column: 27, scope: !123)
!142 = !DILocalVariable(name: "data", scope: !143, file: !12, line: 77, type: !16)
!143 = distinct !DILexicalBlock(scope: !123, file: !12, line: 76, column: 5)
!144 = !DILocation(line: 77, column: 19, scope: !143)
!145 = !DILocation(line: 77, column: 27, scope: !143)
!146 = !DILocation(line: 77, column: 26, scope: !143)
!147 = !DILocation(line: 79, column: 16, scope: !143)
!148 = !DILocation(line: 79, column: 14, scope: !143)
!149 = !DILocation(line: 80, column: 21, scope: !143)
!150 = !DILocation(line: 80, column: 10, scope: !143)
!151 = !DILocation(line: 80, column: 19, scope: !143)
!152 = !DILocalVariable(name: "data", scope: !153, file: !12, line: 83, type: !16)
!153 = distinct !DILexicalBlock(scope: !123, file: !12, line: 82, column: 5)
!154 = !DILocation(line: 83, column: 19, scope: !153)
!155 = !DILocation(line: 83, column: 27, scope: !153)
!156 = !DILocation(line: 83, column: 26, scope: !153)
!157 = !DILocalVariable(name: "i", scope: !158, file: !12, line: 85, type: !61)
!158 = distinct !DILexicalBlock(scope: !153, file: !12, line: 84, column: 9)
!159 = !DILocation(line: 85, column: 20, scope: !158)
!160 = !DILocalVariable(name: "destLen", scope: !158, file: !12, line: 85, type: !61)
!161 = !DILocation(line: 85, column: 23, scope: !158)
!162 = !DILocalVariable(name: "dest", scope: !158, file: !12, line: 86, type: !32)
!163 = !DILocation(line: 86, column: 21, scope: !158)
!164 = !DILocation(line: 87, column: 21, scope: !158)
!165 = !DILocation(line: 87, column: 13, scope: !158)
!166 = !DILocation(line: 88, column: 13, scope: !158)
!167 = !DILocation(line: 88, column: 25, scope: !158)
!168 = !DILocation(line: 89, column: 30, scope: !158)
!169 = !DILocation(line: 89, column: 23, scope: !158)
!170 = !DILocation(line: 89, column: 21, scope: !158)
!171 = !DILocation(line: 92, column: 20, scope: !172)
!172 = distinct !DILexicalBlock(scope: !158, file: !12, line: 92, column: 13)
!173 = !DILocation(line: 92, column: 18, scope: !172)
!174 = !DILocation(line: 92, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !12, line: 92, column: 13)
!176 = !DILocation(line: 92, column: 29, scope: !175)
!177 = !DILocation(line: 92, column: 27, scope: !175)
!178 = !DILocation(line: 92, column: 13, scope: !172)
!179 = !DILocation(line: 94, column: 27, scope: !180)
!180 = distinct !DILexicalBlock(scope: !175, file: !12, line: 93, column: 13)
!181 = !DILocation(line: 94, column: 32, scope: !180)
!182 = !DILocation(line: 94, column: 22, scope: !180)
!183 = !DILocation(line: 94, column: 17, scope: !180)
!184 = !DILocation(line: 94, column: 25, scope: !180)
!185 = !DILocation(line: 95, column: 13, scope: !180)
!186 = !DILocation(line: 92, column: 39, scope: !175)
!187 = !DILocation(line: 92, column: 13, scope: !175)
!188 = distinct !{!188, !178, !189, !94}
!189 = !DILocation(line: 95, column: 13, scope: !172)
!190 = !DILocation(line: 96, column: 13, scope: !158)
!191 = !DILocation(line: 96, column: 25, scope: !158)
!192 = !DILocation(line: 97, column: 24, scope: !158)
!193 = !DILocation(line: 97, column: 13, scope: !158)
!194 = !DILocation(line: 100, column: 1, scope: !123)
