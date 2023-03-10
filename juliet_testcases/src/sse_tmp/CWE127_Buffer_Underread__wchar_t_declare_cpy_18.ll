; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_18.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  br label %source, !dbg !30

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !31), !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !34
  store i32* %add.ptr, i32** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !43
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !44
  store i32 0, i32* %arrayidx4, align 4, !dbg !45
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !46
  %0 = load i32*, i32** %data, align 8, !dbg !47
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %0) #4, !dbg !48
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !49
  call void @printWLine(i32* %arraydecay7), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_18_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #4, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #4, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_18_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_18_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !80
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !81
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  br label %source, !dbg !84

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !85), !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !87
  store i32* %arraydecay1, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !92
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 199) #4, !dbg !93
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !94
  store i32 0, i32* %arrayidx4, align 4, !dbg !95
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !96
  %0 = load i32*, i32** %data, align 8, !dbg !97
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %0) #4, !dbg !98
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !99
  call void @printWLine(i32* %arraydecay7), !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILabel(scope: !11, name: "source", file: !12, line: 30)
!32 = !DILocation(line: 30, column: 1, scope: !11)
!33 = !DILocation(line: 32, column: 12, scope: !11)
!34 = !DILocation(line: 32, column: 23, scope: !11)
!35 = !DILocation(line: 32, column: 10, scope: !11)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 34, type: !38)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 200)
!41 = !DILocation(line: 34, column: 17, scope: !37)
!42 = !DILocation(line: 35, column: 17, scope: !37)
!43 = !DILocation(line: 35, column: 9, scope: !37)
!44 = !DILocation(line: 36, column: 9, scope: !37)
!45 = !DILocation(line: 36, column: 23, scope: !37)
!46 = !DILocation(line: 38, column: 16, scope: !37)
!47 = !DILocation(line: 38, column: 22, scope: !37)
!48 = !DILocation(line: 38, column: 9, scope: !37)
!49 = !DILocation(line: 39, column: 20, scope: !37)
!50 = !DILocation(line: 39, column: 9, scope: !37)
!51 = !DILocation(line: 41, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_18_good", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 70, column: 5, scope: !52)
!54 = !DILocation(line: 71, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !56, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!19, !19, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 83, type: !19)
!62 = !DILocation(line: 83, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 83, type: !58)
!64 = !DILocation(line: 83, column: 27, scope: !55)
!65 = !DILocation(line: 86, column: 22, scope: !55)
!66 = !DILocation(line: 86, column: 12, scope: !55)
!67 = !DILocation(line: 86, column: 5, scope: !55)
!68 = !DILocation(line: 88, column: 5, scope: !55)
!69 = !DILocation(line: 89, column: 5, scope: !55)
!70 = !DILocation(line: 90, column: 5, scope: !55)
!71 = !DILocation(line: 93, column: 5, scope: !55)
!72 = !DILocation(line: 94, column: 5, scope: !55)
!73 = !DILocation(line: 95, column: 5, scope: !55)
!74 = !DILocation(line: 97, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 50, type: !16)
!77 = !DILocation(line: 50, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !12, line: 51, type: !22)
!79 = !DILocation(line: 51, column: 13, scope: !75)
!80 = !DILocation(line: 52, column: 13, scope: !75)
!81 = !DILocation(line: 52, column: 5, scope: !75)
!82 = !DILocation(line: 53, column: 5, scope: !75)
!83 = !DILocation(line: 53, column: 23, scope: !75)
!84 = !DILocation(line: 54, column: 5, scope: !75)
!85 = !DILabel(scope: !75, name: "source", file: !12, line: 55)
!86 = !DILocation(line: 55, column: 1, scope: !75)
!87 = !DILocation(line: 57, column: 12, scope: !75)
!88 = !DILocation(line: 57, column: 10, scope: !75)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !12, line: 59, type: !38)
!90 = distinct !DILexicalBlock(scope: !75, file: !12, line: 58, column: 5)
!91 = !DILocation(line: 59, column: 17, scope: !90)
!92 = !DILocation(line: 60, column: 17, scope: !90)
!93 = !DILocation(line: 60, column: 9, scope: !90)
!94 = !DILocation(line: 61, column: 9, scope: !90)
!95 = !DILocation(line: 61, column: 23, scope: !90)
!96 = !DILocation(line: 63, column: 16, scope: !90)
!97 = !DILocation(line: 63, column: 22, scope: !90)
!98 = !DILocation(line: 63, column: 9, scope: !90)
!99 = !DILocation(line: 64, column: 20, scope: !90)
!100 = !DILocation(line: 64, column: 9, scope: !90)
!101 = !DILocation(line: 66, column: 1, scope: !75)
