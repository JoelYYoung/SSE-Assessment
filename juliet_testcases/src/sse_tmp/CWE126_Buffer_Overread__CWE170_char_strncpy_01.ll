; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !15, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !22, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !27
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !30
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !31
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !32
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  call void @printLine(i8* %arraydecay3), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_01_good() #0 !dbg !36 {
entry:
  call void @good1(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #5, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #5, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_01_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_01_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !59 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !60, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !63, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !65
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !66
  store i8 0, i8* %arrayidx, align 1, !dbg !67
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !68
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !69
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !70
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !71
  store i8 0, i8* %arrayidx3, align 1, !dbg !72
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  call void @printLine(i8* %arraydecay4), !dbg !74
  ret void, !dbg !75
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_01_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_01.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !16, file: !12, line: 25, type: !17)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 5)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1200, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 150)
!21 = !DILocation(line: 25, column: 14, scope: !16)
!22 = !DILocalVariable(name: "dest", scope: !16, file: !12, line: 25, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 25, column: 25, scope: !16)
!27 = !DILocation(line: 27, column: 9, scope: !16)
!28 = !DILocation(line: 28, column: 9, scope: !16)
!29 = !DILocation(line: 28, column: 19, scope: !16)
!30 = !DILocation(line: 31, column: 17, scope: !16)
!31 = !DILocation(line: 31, column: 23, scope: !16)
!32 = !DILocation(line: 31, column: 9, scope: !16)
!33 = !DILocation(line: 33, column: 19, scope: !16)
!34 = !DILocation(line: 33, column: 9, scope: !16)
!35 = !DILocation(line: 35, column: 1, scope: !11)
!36 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_01_good", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 58, column: 5, scope: !36)
!38 = !DILocation(line: 59, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 70, type: !40, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !42, !43}
!42 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !12, line: 70, type: !42)
!46 = !DILocation(line: 70, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !12, line: 70, type: !43)
!48 = !DILocation(line: 70, column: 27, scope: !39)
!49 = !DILocation(line: 73, column: 22, scope: !39)
!50 = !DILocation(line: 73, column: 12, scope: !39)
!51 = !DILocation(line: 73, column: 5, scope: !39)
!52 = !DILocation(line: 75, column: 5, scope: !39)
!53 = !DILocation(line: 76, column: 5, scope: !39)
!54 = !DILocation(line: 77, column: 5, scope: !39)
!55 = !DILocation(line: 80, column: 5, scope: !39)
!56 = !DILocation(line: 81, column: 5, scope: !39)
!57 = !DILocation(line: 82, column: 5, scope: !39)
!58 = !DILocation(line: 84, column: 5, scope: !39)
!59 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 41, type: !13, scopeLine: 42, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !61, file: !12, line: 44, type: !17)
!61 = distinct !DILexicalBlock(scope: !59, file: !12, line: 43, column: 5)
!62 = !DILocation(line: 44, column: 14, scope: !61)
!63 = !DILocalVariable(name: "dest", scope: !61, file: !12, line: 44, type: !23)
!64 = !DILocation(line: 44, column: 25, scope: !61)
!65 = !DILocation(line: 46, column: 9, scope: !61)
!66 = !DILocation(line: 47, column: 9, scope: !61)
!67 = !DILocation(line: 47, column: 19, scope: !61)
!68 = !DILocation(line: 50, column: 17, scope: !61)
!69 = !DILocation(line: 50, column: 23, scope: !61)
!70 = !DILocation(line: 50, column: 9, scope: !61)
!71 = !DILocation(line: 51, column: 9, scope: !61)
!72 = !DILocation(line: 51, column: 18, scope: !61)
!73 = !DILocation(line: 52, column: 19, scope: !61)
!74 = !DILocation(line: 52, column: 9, scope: !61)
!75 = !DILocation(line: 54, column: 1, scope: !59)
