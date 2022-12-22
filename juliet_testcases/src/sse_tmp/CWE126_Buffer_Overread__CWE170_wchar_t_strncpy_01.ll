; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !15, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !30
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !33
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !34
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !35
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  call void @printWLine(i32* %arraydecay4), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01_good() #0 !dbg !39 {
entry:
  call void @good1(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #4, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #4, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !62 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !63, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !66, metadata !DIExpression()), !dbg !67
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !68
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !69
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !70
  store i32 0, i32* %arrayidx, align 4, !dbg !71
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !73
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !74
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !75
  store i32 0, i32* %arrayidx4, align 4, !dbg !76
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !77
  call void @printWLine(i32* %arraydecay5), !dbg !78
  ret void, !dbg !79
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !16, file: !12, line: 25, type: !17)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 5)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 4800, elements: !21)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{!22}
!22 = !DISubrange(count: 150)
!23 = !DILocation(line: 25, column: 17, scope: !16)
!24 = !DILocalVariable(name: "dest", scope: !16, file: !12, line: 25, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 25, column: 28, scope: !16)
!29 = !DILocation(line: 27, column: 17, scope: !16)
!30 = !DILocation(line: 27, column: 9, scope: !16)
!31 = !DILocation(line: 28, column: 9, scope: !16)
!32 = !DILocation(line: 28, column: 19, scope: !16)
!33 = !DILocation(line: 31, column: 17, scope: !16)
!34 = !DILocation(line: 31, column: 23, scope: !16)
!35 = !DILocation(line: 31, column: 9, scope: !16)
!36 = !DILocation(line: 33, column: 20, scope: !16)
!37 = !DILocation(line: 33, column: 9, scope: !16)
!38 = !DILocation(line: 35, column: 1, scope: !11)
!39 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_01_good", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 58, column: 5, scope: !39)
!41 = !DILocation(line: 59, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 70, type: !43, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!20, !20, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !12, line: 70, type: !20)
!49 = !DILocation(line: 70, column: 14, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !12, line: 70, type: !45)
!51 = !DILocation(line: 70, column: 27, scope: !42)
!52 = !DILocation(line: 73, column: 22, scope: !42)
!53 = !DILocation(line: 73, column: 12, scope: !42)
!54 = !DILocation(line: 73, column: 5, scope: !42)
!55 = !DILocation(line: 75, column: 5, scope: !42)
!56 = !DILocation(line: 76, column: 5, scope: !42)
!57 = !DILocation(line: 77, column: 5, scope: !42)
!58 = !DILocation(line: 80, column: 5, scope: !42)
!59 = !DILocation(line: 81, column: 5, scope: !42)
!60 = !DILocation(line: 82, column: 5, scope: !42)
!61 = !DILocation(line: 84, column: 5, scope: !42)
!62 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 41, type: !13, scopeLine: 42, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !64, file: !12, line: 44, type: !17)
!64 = distinct !DILexicalBlock(scope: !62, file: !12, line: 43, column: 5)
!65 = !DILocation(line: 44, column: 17, scope: !64)
!66 = !DILocalVariable(name: "dest", scope: !64, file: !12, line: 44, type: !25)
!67 = !DILocation(line: 44, column: 28, scope: !64)
!68 = !DILocation(line: 46, column: 17, scope: !64)
!69 = !DILocation(line: 46, column: 9, scope: !64)
!70 = !DILocation(line: 47, column: 9, scope: !64)
!71 = !DILocation(line: 47, column: 19, scope: !64)
!72 = !DILocation(line: 50, column: 17, scope: !64)
!73 = !DILocation(line: 50, column: 23, scope: !64)
!74 = !DILocation(line: 50, column: 9, scope: !64)
!75 = !DILocation(line: 51, column: 9, scope: !64)
!76 = !DILocation(line: 51, column: 18, scope: !64)
!77 = !DILocation(line: 52, column: 20, scope: !64)
!78 = !DILocation(line: 52, column: 9, scope: !64)
!79 = !DILocation(line: 54, column: 1, scope: !62)
