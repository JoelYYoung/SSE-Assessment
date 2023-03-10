; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !31
  store i32* %add.ptr, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !39
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !41
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx4, align 4, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %0, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !51
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx5 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !51
  %3 = load i32, i32* %arrayidx5, align 4, !dbg !51
  %4 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !55
  store i32 %3, i32* %arrayidx6, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %5, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx7, align 4, !dbg !64
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  call void @printWLine(i32* %arraydecay8), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_15_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #4, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #4, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_15_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_15_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !97
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !98
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !101
  store i32* %arraydecay1, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !109
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx4, align 4, !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !115
  %cmp = icmp ult i64 %0, 100, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %2 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx5 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !119
  %3 = load i32, i32* %arrayidx5, align 4, !dbg !119
  %4 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !123
  store i32 %3, i32* %arrayidx6, align 4, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %5, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx7, align 4, !dbg !131
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  call void @printWLine(i32* %arraydecay8), !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !140
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !141
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx, align 4, !dbg !143
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !144
  store i32* %arraydecay1, i32** %data, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !152
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx4, align 4, !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !158
  %cmp = icmp ult i64 %0, 100, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !162
  %2 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx5 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !162
  %3 = load i32, i32* %arrayidx5, align 4, !dbg !162
  %4 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !166
  store i32 %3, i32* %arrayidx6, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %5, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !173
  store i32 0, i32* %arrayidx7, align 4, !dbg !174
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !175
  call void @printWLine(i32* %arraydecay8), !dbg !176
  ret void, !dbg !177
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 33, column: 16, scope: !11)
!31 = !DILocation(line: 33, column: 27, scope: !11)
!32 = !DILocation(line: 33, column: 14, scope: !11)
!33 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 41, type: !35)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !36)
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 41, column: 16, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 42, type: !22)
!39 = !DILocation(line: 42, column: 17, scope: !34)
!40 = !DILocation(line: 43, column: 17, scope: !34)
!41 = !DILocation(line: 43, column: 9, scope: !34)
!42 = !DILocation(line: 44, column: 9, scope: !34)
!43 = !DILocation(line: 44, column: 21, scope: !34)
!44 = !DILocation(line: 46, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !12, line: 46, column: 9)
!46 = !DILocation(line: 46, column: 14, scope: !45)
!47 = !DILocation(line: 46, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 46, column: 9)
!49 = !DILocation(line: 46, column: 23, scope: !48)
!50 = !DILocation(line: 46, column: 9, scope: !45)
!51 = !DILocation(line: 48, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 47, column: 9)
!53 = !DILocation(line: 48, column: 28, scope: !52)
!54 = !DILocation(line: 48, column: 18, scope: !52)
!55 = !DILocation(line: 48, column: 13, scope: !52)
!56 = !DILocation(line: 48, column: 21, scope: !52)
!57 = !DILocation(line: 49, column: 9, scope: !52)
!58 = !DILocation(line: 46, column: 31, scope: !48)
!59 = !DILocation(line: 46, column: 9, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 49, column: 9, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 51, column: 9, scope: !34)
!64 = !DILocation(line: 51, column: 21, scope: !34)
!65 = !DILocation(line: 52, column: 20, scope: !34)
!66 = !DILocation(line: 52, column: 9, scope: !34)
!67 = !DILocation(line: 54, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_15_good", scope: !12, file: !12, line: 128, type: !13, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 130, column: 5, scope: !68)
!70 = !DILocation(line: 131, column: 5, scope: !68)
!71 = !DILocation(line: 132, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 144, type: !73, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!19, !19, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 144, type: !19)
!79 = !DILocation(line: 144, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 144, type: !75)
!81 = !DILocation(line: 144, column: 27, scope: !72)
!82 = !DILocation(line: 147, column: 22, scope: !72)
!83 = !DILocation(line: 147, column: 12, scope: !72)
!84 = !DILocation(line: 147, column: 5, scope: !72)
!85 = !DILocation(line: 149, column: 5, scope: !72)
!86 = !DILocation(line: 150, column: 5, scope: !72)
!87 = !DILocation(line: 151, column: 5, scope: !72)
!88 = !DILocation(line: 154, column: 5, scope: !72)
!89 = !DILocation(line: 155, column: 5, scope: !72)
!90 = !DILocation(line: 156, column: 5, scope: !72)
!91 = !DILocation(line: 158, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 63, type: !16)
!94 = !DILocation(line: 63, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !12, line: 64, type: !22)
!96 = !DILocation(line: 64, column: 13, scope: !92)
!97 = !DILocation(line: 65, column: 13, scope: !92)
!98 = !DILocation(line: 65, column: 5, scope: !92)
!99 = !DILocation(line: 66, column: 5, scope: !92)
!100 = !DILocation(line: 66, column: 23, scope: !92)
!101 = !DILocation(line: 75, column: 16, scope: !92)
!102 = !DILocation(line: 75, column: 14, scope: !92)
!103 = !DILocalVariable(name: "i", scope: !104, file: !12, line: 79, type: !35)
!104 = distinct !DILexicalBlock(scope: !92, file: !12, line: 78, column: 5)
!105 = !DILocation(line: 79, column: 16, scope: !104)
!106 = !DILocalVariable(name: "dest", scope: !104, file: !12, line: 80, type: !22)
!107 = !DILocation(line: 80, column: 17, scope: !104)
!108 = !DILocation(line: 81, column: 17, scope: !104)
!109 = !DILocation(line: 81, column: 9, scope: !104)
!110 = !DILocation(line: 82, column: 9, scope: !104)
!111 = !DILocation(line: 82, column: 21, scope: !104)
!112 = !DILocation(line: 84, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !12, line: 84, column: 9)
!114 = !DILocation(line: 84, column: 14, scope: !113)
!115 = !DILocation(line: 84, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 84, column: 9)
!117 = !DILocation(line: 84, column: 23, scope: !116)
!118 = !DILocation(line: 84, column: 9, scope: !113)
!119 = !DILocation(line: 86, column: 23, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 85, column: 9)
!121 = !DILocation(line: 86, column: 28, scope: !120)
!122 = !DILocation(line: 86, column: 18, scope: !120)
!123 = !DILocation(line: 86, column: 13, scope: !120)
!124 = !DILocation(line: 86, column: 21, scope: !120)
!125 = !DILocation(line: 87, column: 9, scope: !120)
!126 = !DILocation(line: 84, column: 31, scope: !116)
!127 = !DILocation(line: 84, column: 9, scope: !116)
!128 = distinct !{!128, !118, !129, !62}
!129 = !DILocation(line: 87, column: 9, scope: !113)
!130 = !DILocation(line: 89, column: 9, scope: !104)
!131 = !DILocation(line: 89, column: 21, scope: !104)
!132 = !DILocation(line: 90, column: 20, scope: !104)
!133 = !DILocation(line: 90, column: 9, scope: !104)
!134 = !DILocation(line: 92, column: 1, scope: !92)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "data", scope: !135, file: !12, line: 97, type: !16)
!137 = !DILocation(line: 97, column: 15, scope: !135)
!138 = !DILocalVariable(name: "dataBuffer", scope: !135, file: !12, line: 98, type: !22)
!139 = !DILocation(line: 98, column: 13, scope: !135)
!140 = !DILocation(line: 99, column: 13, scope: !135)
!141 = !DILocation(line: 99, column: 5, scope: !135)
!142 = !DILocation(line: 100, column: 5, scope: !135)
!143 = !DILocation(line: 100, column: 23, scope: !135)
!144 = !DILocation(line: 105, column: 16, scope: !135)
!145 = !DILocation(line: 105, column: 14, scope: !135)
!146 = !DILocalVariable(name: "i", scope: !147, file: !12, line: 113, type: !35)
!147 = distinct !DILexicalBlock(scope: !135, file: !12, line: 112, column: 5)
!148 = !DILocation(line: 113, column: 16, scope: !147)
!149 = !DILocalVariable(name: "dest", scope: !147, file: !12, line: 114, type: !22)
!150 = !DILocation(line: 114, column: 17, scope: !147)
!151 = !DILocation(line: 115, column: 17, scope: !147)
!152 = !DILocation(line: 115, column: 9, scope: !147)
!153 = !DILocation(line: 116, column: 9, scope: !147)
!154 = !DILocation(line: 116, column: 21, scope: !147)
!155 = !DILocation(line: 118, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !147, file: !12, line: 118, column: 9)
!157 = !DILocation(line: 118, column: 14, scope: !156)
!158 = !DILocation(line: 118, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !12, line: 118, column: 9)
!160 = !DILocation(line: 118, column: 23, scope: !159)
!161 = !DILocation(line: 118, column: 9, scope: !156)
!162 = !DILocation(line: 120, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 119, column: 9)
!164 = !DILocation(line: 120, column: 28, scope: !163)
!165 = !DILocation(line: 120, column: 18, scope: !163)
!166 = !DILocation(line: 120, column: 13, scope: !163)
!167 = !DILocation(line: 120, column: 21, scope: !163)
!168 = !DILocation(line: 121, column: 9, scope: !163)
!169 = !DILocation(line: 118, column: 31, scope: !159)
!170 = !DILocation(line: 118, column: 9, scope: !159)
!171 = distinct !{!171, !161, !172, !62}
!172 = !DILocation(line: 121, column: 9, scope: !156)
!173 = !DILocation(line: 123, column: 9, scope: !147)
!174 = !DILocation(line: 123, column: 21, scope: !147)
!175 = !DILocation(line: 124, column: 20, scope: !147)
!176 = !DILocation(line: 124, column: 9, scope: !147)
!177 = !DILocation(line: 126, column: 1, scope: !135)
